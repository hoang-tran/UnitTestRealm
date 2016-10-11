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

class PersonSpec: BaseSpec {
  override func spec() {
    super.spec()

    describe("initialize with name and age") {
      let personName = "name A"
      let personAge = 18

      it("initializes correctly") {
        let person = Person(name: personName, age: personAge)
        expect(person.name) == personName
        expect(person.age) == personAge
      }
    }
  }
}
