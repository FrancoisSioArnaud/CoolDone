//
//  DoneCooldownIntent.swift
//  CoolDownWidget
//
//  Created by François Arnaud on 31/05/2026.
//

import AppIntents
import Foundation
import WidgetKit

struct DoneCooldownIntent: AppIntent {
    static let title: LocalizedStringResource = "C’est fait"
    static let description = IntentDescription("Marque un Cooldown comme fait sans ouvrir l’app.")
    static var openAppWhenRun: Bool = false

    @Parameter(title: "Cooldown")
    var cooldownID: String

    init() {
        cooldownID = ""
    }

    init(cooldownID: String) {
        self.cooldownID = cooldownID
    }

    func perform() async throws -> some IntentResult {
        guard let id = UUID(uuidString: cooldownID) else {
            return .result()
        }

        let storage = CooldownStorage()
        var cooldowns = storage.loadCooldowns()

        guard CooldownMutation.markDone(id: id, in: &cooldowns),
              let updatedCooldown = cooldowns.first(where: { $0.id == id }) else {
            return .result()
        }

        storage.saveCooldowns(cooldowns)
        await CooldownNotificationScheduler().rescheduleNotification(for: updatedCooldown)
        WidgetCenter.shared.reloadAllTimelines()

        return .result()
    }
}
