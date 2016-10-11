//
//  UserSpec.swift
//  UnitTestRealm
//
//  Created by Hoang Tran on 10/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import UnitTestRealm

class PersonSpec: BaseSpec {
  override func spec() {
    super.spec()

    let personName = "name A"
    let personAge = 18

    describe("initialize with name and age") {
      it("initializes correctly") {
        let person = Person(name: personName, age: personAge)
        expect(person.name) == personName
        expect(person.age) == personAge
      }
    }

    describe("relationships") {
      let dogName = "dog name A"

      describe("to-one relationship") {
        it("saves the object and its relationship to database correctly") {
          let person = Person(name: personName, age: personAge)
          let dog = Dog(value: ["name": dogName])
          dog.owner = person
          let realm = try! Realm()
          try! realm.write {
            realm.add(dog)
          }
          let dogFromDatabase = realm.objects(Dog.self).first
          expect(dogFromDatabase?.name) == dogName
          expect(dogFromDatabase?.owner?.name) == person.name
          expect(dogFromDatabase?.owner?.age) == person.age
        }
      }

      describe("to-many relationship") {
        it("saves the object and its relationship to database correctly") {
          let person = Person(name: personName, age: personAge)
          let dog0 = Dog(value: ["name": "dog 0"])
          let dog1 = Dog(value: ["name": "dog 1"])
          person.dogs.append(dog0)
          person.dogs.append(dog1)
          let realm = try! Realm()
          try! realm.write {
            realm.add(person)
          }
          let personFromDatabase = realm.objects(Person.self).first
          expect(personFromDatabase?.dogs.count) == 2
          expect(personFromDatabase?.dogs[0].name) == "dog 0"
          expect(personFromDatabase?.dogs[1].name) == "dog 1"
        }
      }

      describe("inverse relationship") {
        it("saves the object and its relationship to database correctly") {
          let person0 = Person(name: "person 0", age: personAge)
          let person1 = Person(name: "person 1", age: personAge)
          let dog = Dog(value: ["name": dogName])
          person0.dogs.append(dog)
          person1.dogs.append(dog)
          let realm = try! Realm()
          try! realm.write {
            realm.add(person0)
            realm.add(person1)
          }
          let dogFromDatabase = realm.objects(Dog.self).first
          expect(dogFromDatabase?.owners.count) == 2
          expect(dogFromDatabase?.owners[0].name) == person0.name
          expect(dogFromDatabase?.owners[1].name) == person1.name
        }
      }
    }
  }
}
