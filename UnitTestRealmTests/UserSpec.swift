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

    describe("first test") {
      it("should pass") {
        expect(1 + 1) == 2
      }
    }
  }
}
