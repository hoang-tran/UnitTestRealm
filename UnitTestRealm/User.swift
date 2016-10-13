//
//  User.swift
//  UnitTestRealm
//
//  Created by Hoang Tran on 10/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Realm
import RealmSwift

class Person: Object {
  dynamic var name = ""
  dynamic var age = 0
  dynamic var address = ""
  dynamic var height = 0.0
  dynamic var id = 0
  let dogs = List<Dog>()

  convenience init(id: Int, name: String, age: Int) {
    self.init()
    self.id = id
    self.name = name
    self.age = age
  }

  override static func ignoredProperties() -> [String] {
    return ["address", "height"]
  }

  override static func primaryKey() -> String? {
    return "id"
  }
}

extension Person {
  func save() {
    let realm = try! Realm()
    try! realm.write {
      realm.add(self)
    }
  }

  class func all() -> Results<Person> {
    let realm = try! Realm()
    return realm.objects(Person.self)
  }

  class func adults() -> Results<Person> {
    let realm = try! Realm()
    return realm.objects(Person.self).filter("age >= 18")
  }

  class func oldestFirst() -> Results<Person> {
    let realm = try! Realm()
    return realm.objects(Person.self).sorted("age", ascending: false)
  }

  class func first(number: UInt) -> [Person] {
    let realm = try! Realm()
    let results = realm.objects(Person.self)
    var limitedResults = [Person]()
    for i in 0..<min(Int(number), results.count) {
      limitedResults.append(results[i])
    }
    return limitedResults
  }

  func updateName(name: String, age: Int) {
    let realm = try! Realm()
    try! realm.write {
      self.name = name
      self.age = age
    }
  }

  func updateFrom(person: Person) {
    guard self.id == person.id else { return }
    let realm = try! Realm()
    try! realm.write {
      realm.add(person, update: true)
    }
  }

  func delete() {
    let realm = try! Realm()
    try! realm.write {
      realm.delete(self)
    }
  }
}