//
//  Achievement.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-24.
//

internal class Achievement {
    private(set) var group: Group
    private(set) var name: String
    private(set) var details: String?
    private(set) var iconName: String
    private(set) var achieved: Bool
    
    init(group: Group, name: String, details:String?, iconName: String, achieved: Bool) {
        self.group = group
        self.name = name
        self.details = details
        self.achieved = achieved
        self.iconName = iconName
    }
    
    internal enum Group : UInt {
        case PersonalRecords = 0
        case VirtualRaces
        
        internal static func allCases() -> [Group] {
            return [ .PersonalRecords, .VirtualRaces ]
        }
    }
    
    internal enum PersonalRecords: String {
        case longestRun = "longest_run"
        case highestElevation = "highest_elevation"
        case fastest5k = "fastest_5k"
        case fastest10k = "fastest_10k"
        case fastestHalfMarathon = "fastest_half_marathon"
        case fastestMarathon = "fastest_marathon"

        internal static func allCases() -> [PersonalRecords] {
            return [
                .longestRun, .highestElevation, .fastest5k,
                .fastest10k, fastestHalfMarathon, fastestMarathon
            ]
        }
    }
    
    internal enum VirtualRaces: String {
        case virtualHalfMarathonRace = "virtual_half_marathon_race"
        case tokyoKakoneEkiden = "tokyo_kakone_ekiden"
        case virtual10kRace = "virtual_10k_race"
        case hakoneEkiden = "hakone_ekiden"
        case mizunoSingaporeEkiden = "mizuno_singapore_ekiden"
        case virtual5kRace = "virtual_5k_race"
        
        internal static func allCases() -> [VirtualRaces] {
            return [
                .virtualHalfMarathonRace, .tokyoKakoneEkiden, virtual10kRace,
                .hakoneEkiden, .mizunoSingaporeEkiden, .virtual5kRace
            ]
        }
    }
}
