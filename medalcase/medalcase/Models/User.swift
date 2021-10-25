//
//  User.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-24.
//

import Foundation

internal class User {
    private(set) var achievements: [Achievement]
    
    init(achievements: [Achievement]) {
        self.achievements = achievements
    }
}

/*
 * Note: I decided to create this class only with the homework
 * property 'achievements', but in practice this class would have
 * other info about the current user that would likely derive from
 * class User. I didn't get an API or a json to parse, so I decided
 * to mock the values.
 */
internal class SessionUser : User {

    private static var userDetails: Dictionary<String, String> {
        // Imagine these values would come from the API
        return [
            Achievement.PersonalRecords.fastest5k.rawValue : "00:00",
            Achievement.PersonalRecords.fastest10k.rawValue : "00:00:00",
            Achievement.PersonalRecords.longestRun.rawValue : "00:00",
            Achievement.PersonalRecords.highestElevation.rawValue : "2095 ft",
            Achievement.PersonalRecords.fastestHalfMarathon.rawValue : "00:00",
            Achievement.VirtualRaces.virtualHalfMarathonRace.rawValue : "00:00",
            Achievement.VirtualRaces.tokyoKakoneEkiden.rawValue : "00:00:00",
            Achievement.VirtualRaces.virtual10kRace.rawValue : "00:00:00",
            Achievement.VirtualRaces.hakoneEkiden.rawValue : "00:00:00",
            Achievement.VirtualRaces.mizunoSingaporeEkiden.rawValue : "00:00:00",
            Achievement.VirtualRaces.virtual5kRace.rawValue : "23:07",
        ]
    }

    internal static var sessionUserExercise: User {
        let personalItems = Achievement.PersonalRecords.allCases().map { el in
            Achievement(group: Achievement.Group.PersonalRecords,
                        name: String.localized(forKey: el.rawValue),
                        details: userDetails[el.rawValue],
                        iconName: el.rawValue,
                        achieved: el != Achievement.PersonalRecords.fastestMarathon)
        }
        let virtualRaceItems = Achievement.VirtualRaces.allCases().map { el in
            Achievement(group: Achievement.Group.VirtualRaces,
                        name: String.localized(forKey: el.rawValue),
                        details: userDetails[el.rawValue],
                        iconName: el.rawValue,
                        achieved: true)
        }
        return User(achievements: personalItems + virtualRaceItems)
    }
}
