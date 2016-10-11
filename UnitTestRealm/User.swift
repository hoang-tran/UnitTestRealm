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
  let dogs = List<Dog>()

  convenience init(name: String, age: Int) {
    self.init()
    self.name = name
    self.age = age
  }

  override static func ignoredProperties() -> [String] {
    return ["address", "height"]
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
}