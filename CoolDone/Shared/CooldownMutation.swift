//
//  CooldownMutation.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation

enum CooldownMutation {
    @discardableResult
    static func markDone(id: Cooldown.ID, in cooldowns: inout [Cooldown], at date: Date = Date()) -> Bool {
        guard let index = cooldowns.firstIndex(where: { $0.id == id }) else {
            return false
        }

        cooldowns[index].lastDoneAt = date
        return true
    }
}
