//
//  MedalIcons.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-23.
//

import UIKit

public struct Medal {

    @available(*, unavailable) private init() {}
    
    private static func image(named:String) throws -> UIImage {
        guard let image = UIImage(named: named) else {
            throw Error.resourceNotFound()
        }
        
        return image
    }
    
    internal struct PersonalRecords {
        @available(*, unavailable) private init() {}
        
        internal enum Icon: String {
            case longestRun = "longest_run"
            case highestElevation = "highest_elevation"
            case fastest5k = "fastest_5k"
            case fastest10k = "fastest_10k"
            case fastestHalfMarathon = "fastest_half_marathon"
            case fastestMarathon = "fastest_marathon"
            
            private static func allCases() -> [Icon] {
                return [
                    .longestRun, .highestElevation, .fastest5k,
                    .fastest10k, fastestHalfMarathon, fastestMarathon
                ]
            }
            
            internal static func all() -> [UIImage] {
                return allCases().map { el in try! Medal.image(named: el.rawValue) }
            }
        }
        
        internal static func longestRun() throws ->  UIImage {
            return try Medal.image(named: Icon.longestRun.rawValue)
        }
        
        internal static func highestElevation() throws ->  UIImage {
            return try Medal.image(named: Icon.highestElevation.rawValue)
        }
        
        internal static func fastest5k() throws ->  UIImage {
            return try Medal.image(named: Icon.fastest5k.rawValue)
        }

        internal static func fastest10k() throws ->  UIImage {
            return try Medal.image(named: Icon.fastest10k.rawValue)
        }

        internal static func fastestHalfMarathon() throws ->  UIImage {
            return try Medal.image(named: Icon.fastestHalfMarathon.rawValue)
        }

        internal static func fastestMarathon() throws ->  UIImage {
            return try Medal.image(named: Icon.fastestMarathon.rawValue)
        }
    }
    
    internal struct VirtualRaces {
        @available(*, unavailable) private init() {}
        
        internal enum Icon: String {
            case virtual5kRace = "virtual_5k_race"
            case virtual10kRace = "virtual_10k_race"
            case mizunoSingaporeEkiden = "mizuno_singapore_ekiden"
            case hakoneEkiden = "hakone_ekiden"
            case tokyoKakoneEkiden = "tokyo_kakone_ekiden"
            case virtualHalfMarathonRace = "virtual_half_marathon_race"
            case virtualMarathonRace = "virtual_marathon_race"
            
            private static func allCases() -> [Icon] {
                return [
                    .virtual5kRace, .virtual10kRace, .mizunoSingaporeEkiden,
                    .hakoneEkiden, .tokyoKakoneEkiden, .virtualHalfMarathonRace,
                    virtualMarathonRace
                ]
            }
            
            internal static func all() -> [UIImage] {
                return allCases().map { el in try! Medal.image(named: el.rawValue) }
            }
        }
        
        internal static func virtual5kRace() throws ->  UIImage {
            return try Medal.image(named: Icon.virtual5kRace.rawValue)
        }
        
        internal static func virtual10kRace() throws ->  UIImage {
            return try Medal.image(named: Icon.virtual10kRace.rawValue)
        }
        
        internal static func mizunoSingaporeEkiden() throws ->  UIImage {
            return try Medal.image(named: Icon.mizunoSingaporeEkiden.rawValue)
        }
        
        internal static func hakoneEkiden() throws ->  UIImage {
            return try Medal.image(named: Icon.hakoneEkiden.rawValue)
        }

        internal static func tokyoKakoneEkiden() throws ->  UIImage {
            return try Medal.image(named: Icon.tokyoKakoneEkiden.rawValue)
        }

        internal static func virtualHalfMarathonRace() throws ->  UIImage {
            return try Medal.image(named: Icon.virtualHalfMarathonRace.rawValue)
        }
        
        internal static func virtualMarathonRace() throws ->  UIImage {
            return try Medal.image(named: Icon.virtualMarathonRace.rawValue)
        }
    }
}
