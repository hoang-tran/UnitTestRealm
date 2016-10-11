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
    }
  }
}
