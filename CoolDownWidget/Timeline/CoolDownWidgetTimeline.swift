//
//  CoolDownWidgetTimeline.swift
//  CoolDownWidget
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation
import WidgetKit

struct CoolDownWidgetProvider: TimelineProvider {
    private let storage: CooldownStorageProtocol
    private let calendar: Calendar

    init(
        storage: CooldownStorageProtocol = CooldownStorage(),
        calendar: Calendar = .current
    ) {
        self.storage = storage
        self.calendar = calendar
    }

    func placeholder(in context: Context) -> CoolDownWidgetEntry {
        CoolDownWidgetEntry(date: Date(), cooldowns: Self.previewCooldowns(referenceDate: Date()))
    }

    func getSnapshot(in context: Context, completion: @escaping (CoolDownWidgetEntry) -> Void) {
        let now = Date()
        let cooldowns = context.isPreview ? Self.previewCooldowns(referenceDate: now) : sortedCooldowns(at: now)
        completion(CoolDownWidgetEntry(date: now, cooldowns: cooldowns))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<CoolDownWidgetEntry>) -> Void) {
        let now = Date()
        let cooldowns = storage.loadCooldowns()
        let entryDates = timelineDates(from: now, cooldowns: cooldowns)
        let entries = entryDates.map { date in
            CoolDownWidgetEntry(date: date, cooldowns: sortedCooldowns(cooldowns, at: date))
        }

        let refreshDate = entryDates.last ?? now.addingTimeInterval(6 * 60 * 60)
        completion(Timeline(entries: entries, policy: .after(refreshDate)))
    }

    private func sortedCooldowns(at date: Date) -> [Cooldown] {
        sortedCooldowns(storage.loadCooldowns(), at: date)
    }

    private func sortedCooldowns(_ cooldowns: [Cooldown], at date: Date) -> [Cooldown] {
        cooldowns
            .enumerated()
            .sorted { lhs, rhs in
                let lhsProgress = ProgressCalculator.remainingRatio(for: lhs.element, at: date)
                let rhsProgress = ProgressCalculator.remainingRatio(for: rhs.element, at: date)

                if lhsProgress != rhsProgress {
                    return lhsProgress < rhsProgress
                }

                return lhs.offset < rhs.offset
            }
            .map(\.element)
    }

    private func timelineDates(from now: Date, cooldowns: [Cooldown]) -> [Date] {
        var dates = Set<Date>()
        dates.insert(now)

        let timelineHorizon = now.addingTimeInterval(6 * 60 * 60)

        for hourOffset in stride(from: 2, through: 6, by: 2) {
            if let date = calendar.date(byAdding: .hour, value: hourOffset, to: now) {
                dates.insert(date)
            }
        }

        for cooldown in cooldowns {
            for threshold in [
                CooldownProgressThresholds.highToMiddle,
                CooldownProgressThresholds.middleToLow,
                0.0
            ] {
                let thresholdDate = date(for: cooldown, reaching: threshold)
                if thresholdDate > now,
                   thresholdDate <= timelineHorizon {
                    dates.insert(thresholdDate)
                }
            }
        }

        return dates.sorted()
    }

    private func date(for cooldown: Cooldown, reaching remainingRatio: Double) -> Date {
        let elapsedRatio = 1 - remainingRatio
        return cooldown.lastDoneAt.addingTimeInterval(cooldown.duration.timeInterval * elapsedRatio)
    }

    static func previewCooldowns(referenceDate: Date) -> [Cooldown] {
        [
            Cooldown(
                name: "Laver la douche",
                duration: .twelveDays,
                cooleur: .sage,
                lastDoneAt: referenceDate.addingTimeInterval(-12 * 24 * 60 * 60)
            ),
            Cooldown(
                name: "Jouer de la guitare",
                duration: .elevenDays,
                cooleur: .lavender,
                lastDoneAt: referenceDate.addingTimeInterval(-9 * 24 * 60 * 60)
            ),
            Cooldown(
                name: "Appeler maman",
                duration: .twentyThreeDays,
                cooleur: .mint,
                lastDoneAt: referenceDate.addingTimeInterval(-12 * 24 * 60 * 60)
            ),
            Cooldown(
                name: "Frisbee avec le chien",
                duration: .fiveDays,
                cooleur: .turquoise,
                lastDoneAt: referenceDate.addingTimeInterval(-1 * 24 * 60 * 60)
            )
        ]
    }
}

struct CoolDownWidgetEntry: TimelineEntry {
    let date: Date
    let cooldowns: [Cooldown]
}
