//
//  medalcaseTests.swift
//  medalcaseTests
//
//  Created by Luiz Peres on 2021-10-23.
//

import XCTest
@testable import medalcase

/*
 * Note: These tests are very basic and test the mininum
 * in the application. In practice I would have many files
 * so I could separate them
 */

class MiscHelperTests : XCTestCase {

    func testSizeForView() throws {
        let label = Label.makeLabel(size: 16, textColor: .white)
        let height = UIView.heightFor(text: String.localized(forKey: "virtual_half_marathon_race"),
                                      font: label.font,
                                      width: 30)
        XCTAssertEqual(height, 143)
    }
    
    func testLocalizableStrings() throws {
        let ofStr = "of"
        XCTAssertEqual(ofStr, String.localized(forKey: "of"))
    }
    
    func testColor() throws {
        let color = ColorTheme.headerLightGray
        XCTAssertNotEqual(UIColor.secondarySystemBackground, color)
    }
}

class ModelTests : XCTestCase {
    
    var achievementMock = {
        return Achievement(group: Achievement.Group.PersonalRecords,
                           name: String.localized(forKey: Achievement.PersonalRecords.fastest5k.rawValue),
                           details: nil,
                           iconName: Achievement.PersonalRecords.fastest5k.rawValue,
                           achieved: true)
    }
    
    func testAchievement() throws {
        let achievement = achievementMock()
        XCTAssertEqual(achievement.iconName, Achievement.PersonalRecords.fastest5k.rawValue)
        XCTAssertEqual(achievement.achieved, true)
        XCTAssertEqual(achievement.group, Achievement.Group.PersonalRecords)
        XCTAssertEqual(achievement.name, "Fastest 5k")
        XCTAssertNil(achievement.details)
    }
    
    func testUser() throws {
        let user = User(achievements: [achievementMock()])
        XCTAssertEqual(user.achievements.count, 1)
        XCTAssertEqual(user.achievements[0].name, achievementMock().name)
    }
}
