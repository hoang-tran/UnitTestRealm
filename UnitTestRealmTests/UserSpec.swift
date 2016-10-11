//
//  UserSpec.swift
//  UnitTestRealm
//
//  Created by Hoang Tran on 10/11/16.
//  Copyright © 2016 Hoang Tran. All rights reserved.
//

import Quick
import Nimble
@testable import UnitTestRealm

class UserSpec: BaseSpec {
  override func spec() {
    super.spec()

    describe("initialize with name and age") {
      let userName = "name A"
      let userAge = 18

      it("initializes correctly") {
        let user = User(name: userName, age: userAge)
        expect(user.name) == userName
        expect(user.age) == userAge
      }
    }
  }
}
