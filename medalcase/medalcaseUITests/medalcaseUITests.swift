//
//  medalcaseUITests.swift
//  medalcaseUITests
//
//  Created by Luiz Peres on 2021-10-23.
//

import XCTest
@testable import medalcase

class medalcaseUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    
}
