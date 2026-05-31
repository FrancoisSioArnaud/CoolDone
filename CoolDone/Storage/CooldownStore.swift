//
//  CooldownStore.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation
import Observation

typealias CooldownDateProvider = () -> Date

@MainActor
@Observable
final class CooldownStore {
    private(set) var cooldowns: [Cooldown]

    private let storage: CooldownStorageProtocol
    private let notificationScheduler: CooldownNotificationScheduling
    private let dateProvider: CooldownDateProvider

    var sortedCooldowns: [Cooldown] {
        let now = dateProvider()

        return cooldowns
            .enumerated()
            .sorted { lhs, rhs in
                let lhsProgress = ProgressCalculator.remainingRatio(for: lhs.element, at: now)
                let rhsProgress = ProgressCalculator.remainingRatio(for: rhs.element, at: now)

                if lhsProgress != rhsProgress {
                    return lhsProgress < rhsProgress
                }

                return lhs.offset < rhs.offset
            }
            .map(\.element)
    }

    init(
        storage: CooldownStorageProtocol = CooldownStorage(),
        notificationScheduler: CooldownNotificationScheduling = CooldownNotificationScheduler(),
        dateProvider: @escaping CooldownDateProvider = Date.init
    ) {
        self.storage = storage
        self.notificationScheduler = notificationScheduler
        self.dateProvider = dateProvider
        self.cooldowns = storage.loadCooldowns()
    }

    func addCooldown(_ cooldown: Cooldown) {
        cooldowns.append(cooldown)
        save()
        updateNotification(for: cooldown)
    }

    func updateCooldown(_ cooldown: Cooldown) {
        guard let index = cooldowns.firstIndex(where: { $0.id == cooldown.id }) else {
            return
        }

        cooldowns[index] = cooldown
        save()
        updateNotification(for: cooldown)
    }

    func deleteCooldown(id: Cooldown.ID) {
        cooldowns.removeAll { $0.id == id }
        save()
        notificationScheduler.cancelAllNotifications(for: id)
    }

    func markDone(id: Cooldown.ID) {
        guard CooldownMutation.markDone(id: id, in: &cooldowns, at: dateProvider()) else {
            return
        }

        save()

        if let cooldown = cooldowns.first(where: { $0.id == id }) {
            updateNotification(for: cooldown)
        }
    }

    private func updateNotification(for cooldown: Cooldown) {
        if cooldown.notificationsEnabled {
            Task {
                await notificationScheduler.rescheduleNotification(for: cooldown)
            }
        } else {
            notificationScheduler.cancelNotification(for: cooldown.id)
        }
    }

    private func save() {
        storage.saveCooldowns(cooldowns)
    }
}
