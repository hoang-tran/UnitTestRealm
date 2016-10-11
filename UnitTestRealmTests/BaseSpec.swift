//
//  BaseSpec.swift
//  UnitTestRealm
//
//  Created by Hoang Tran on 10/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Quick
import Nimble
import RealmSwift

class BaseSpec: QuickSpec {
  override func spec() {
    super.spec()

    beforeSuite {
      self.useTestDatabase()
    }

    beforeEach {
      self.clearDatabase()
    }
  }
}

extension BaseSpec {
  func useTestDatabase() {
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
  }

  func clearDatabase() {
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }
}