//
//  CooldownDuration.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation

enum CooldownDuration: Int, CaseIterable, Codable, Equatable, Identifiable {
    case threeDays = 3
    case fiveDays = 5
    case eightDays = 8
    case elevenDays = 11
    case twelveDays = 12
    case eighteenDays = 18
    case twentyThreeDays = 23
    case twentySevenDays = 27
    case thirtySevenDays = 37
    case fortyFiveDays = 45
    case fiftyThreeDays = 53
    case seventySixDays = 76

    var id: Int {
        rawValue
    }

    var label: String {
        let weeks = durationInDays / 7
        let days = durationInDays % 7

        guard weeks > 0 else {
            return "\(days) \(days == 1 ? "jour" : "jours")"
        }

        let weekLabel = "\(weeks) \(weeks == 1 ? "semaine" : "semaines")"

        guard days > 0 else {
            return weekLabel
        }

        let dayLabel = "\(days) \(days == 1 ? "jour" : "jours")"
        return "\(weekLabel) et \(dayLabel)"
    }

    var durationInDays: Int {
        rawValue
    }

    var timeInterval: TimeInterval {
        TimeInterval(durationInDays) * 24 * 60 * 60
    }
}
