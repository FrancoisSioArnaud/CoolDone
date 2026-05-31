//
//  Cooldown.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation

struct Cooldown: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var duration: CooldownDuration
    var cooleur: Cooleur
    var lastDoneAt: Date
    var notificationsEnabled: Bool

    init(
        id: UUID = UUID(),
        name: String,
        duration: CooldownDuration,
        cooleur: Cooleur,
        lastDoneAt: Date = Date(),
        notificationsEnabled: Bool = false
    ) {
        self.id = id
        self.name = name
        self.duration = duration
        self.cooleur = cooleur
        self.lastDoneAt = lastDoneAt
        self.notificationsEnabled = notificationsEnabled
    }
}
