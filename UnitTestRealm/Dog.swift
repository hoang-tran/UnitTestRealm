//
//  Dog.swift
//  UnitTestRealm
//
//  Created by Hoang Tran on 10/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Realm
import RealmSwift

class Dog: Object {
  dynamic var name = ""
  dynamic var owner: Person?
  let owners = LinkingObjects(fromType: Person.self, property: "dogs")
}
