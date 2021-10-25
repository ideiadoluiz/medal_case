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

    func testTapAchievements() throws {
        let app = XCUIApplication()
        app.launch()
        
        let cell = app.tables.cells["achievementsCell"]
        cell.tap()
        
        XCTAssertEqual(app.collectionViews.count, 1)
        
        let cells = app.collectionViews.cells
        XCTAssertEqual(cells.count, 12)
        
        let title = app.navigationBars.element(boundBy: 0).staticTexts.element(matching: .any, identifier: "Achievements")
        XCTAssertNotNil(title)
    }
    
    func testBackButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let cell = app.tables.cells["achievementsCell"]
        cell.tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        let cell2 = app.tables.cells["achievementsCell"]
        XCTAssertNotNil(cell2)
    }
}
