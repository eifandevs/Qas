//
//  EnvDataModelTests.swift
//  QassTests
//
//  Created by tenma on 2018/06/17.
//  Copyright © 2018年 eifandevs. All rights reserved.
//

import XCTest

@testable import Qass_Develop

class EnvDataModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGet() {
        _ = EnvDataModel.s.get(key: "KEY.REALM_TOKEN")
    }
}
