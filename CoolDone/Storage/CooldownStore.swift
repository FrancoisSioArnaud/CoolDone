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
        dateProvider: @escaping CooldownDateProvider = Date.init
    ) {
        self.storage = storage
        self.dateProvider = dateProvider
        self.cooldowns = storage.loadCooldowns()
    }

    func addCooldown(_ cooldown: Cooldown) {
        cooldowns.append(cooldown)
        save()
    }

    func updateCooldown(_ cooldown: Cooldown) {
        guard let index = cooldowns.firstIndex(where: { $0.id == cooldown.id }) else {
            return
        }

        cooldowns[index] = cooldown
        save()
    }

    func deleteCooldown(id: Cooldown.ID) {
        cooldowns.removeAll { $0.id == id }
        save()
    }

    func markDone(id: Cooldown.ID) {
        guard let index = cooldowns.firstIndex(where: { $0.id == id }) else {
            return
        }

        cooldowns[index].lastDoneAt = dateProvider()
        save()
    }

    private func save() {
        storage.saveCooldowns(cooldowns)
    }
}
