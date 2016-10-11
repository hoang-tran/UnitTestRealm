//
//  User.swift
//  UnitTestRealm
//
//  Created by Hoang Tran on 10/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Realm
import RealmSwift

class User: Object {
  dynamic var name = ""
  dynamic var age = 0

  convenience init(name: String, age: Int) {
    self.init()
    self.name = name
    self.age = age
  }
}
