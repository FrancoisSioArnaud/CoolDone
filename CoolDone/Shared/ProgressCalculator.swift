//
//  ProgressCalculator.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation

struct ProgressCalculator {
    static func remainingRatio(for cooldown: Cooldown, at now: Date = Date()) -> Double {
        remainingRatio(lastDoneAt: cooldown.lastDoneAt, duration: cooldown.duration, at: now)
    }

    static func remainingRatio(
        lastDoneAt: Date,
        duration: CooldownDuration,
        at now: Date = Date()
    ) -> Double {
        let elapsed = now.timeIntervalSince(lastDoneAt)
        let rawRatio = 1 - (elapsed / duration.timeInterval)
        return clamp(rawRatio)
    }

    static func cooleurVariant(for remainingRatio: Double) -> CooleurVariant {
        let clampedRatio = clamp(remainingRatio)

        if clampedRatio > CooldownProgressThresholds.highToMiddle {
            return .dark
        }

        if clampedRatio > CooldownProgressThresholds.middleToLow {
            return .bright
        }

        return .pastel
    }

    private static func clamp(_ value: Double) -> Double {
        min(max(value, 0.0), 1.0)
    }
}
