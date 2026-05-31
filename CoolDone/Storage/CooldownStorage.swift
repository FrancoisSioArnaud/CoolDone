//
//  CooldownStorage.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation

protocol CooldownStorageProtocol {
    func loadCooldowns() -> [Cooldown]
    func saveCooldowns(_ cooldowns: [Cooldown])
}

struct CooldownStorage: CooldownStorageProtocol {
    private let userDefaults: UserDefaults
    private let legacyUserDefaults: UserDefaults
    private let storageKey: String
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(
        userDefaults: UserDefaults? = UserDefaults(suiteName: CoolDoneSharedConfiguration.appGroupIdentifier),
        legacyUserDefaults: UserDefaults = .standard,
        storageKey: String = CoolDoneSharedConfiguration.cooldownStorageKey,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        if userDefaults == nil {
            NSLog("CoolDone: App Group UserDefaults unavailable for %@. Falling back to standard UserDefaults; widget data may not be shared.", CoolDoneSharedConfiguration.appGroupIdentifier)
        }

        self.userDefaults = userDefaults ?? legacyUserDefaults
        self.legacyUserDefaults = legacyUserDefaults
        self.storageKey = storageKey
        self.encoder = encoder
        self.decoder = decoder

        migrateLegacyCooldownsIfNeeded()
    }

    func loadCooldowns() -> [Cooldown] {
        guard let data = userDefaults.data(forKey: storageKey) else {
            return []
        }

        return decodeCooldowns(from: data) ?? []
    }

    func saveCooldowns(_ cooldowns: [Cooldown]) {
        do {
            let data = try encoder.encode(cooldowns)
            userDefaults.set(data, forKey: storageKey)
            userDefaults.synchronize()
        } catch {
            NSLog("CoolDone: Failed to encode Cooldowns for storage: %@", String(describing: error))
            return
        }
    }

    private func migrateLegacyCooldownsIfNeeded() {
        guard userDefaults !== legacyUserDefaults else {
            return
        }

        guard userDefaults.data(forKey: storageKey) == nil else {
            return
        }

        guard let legacyData = legacyUserDefaults.data(forKey: storageKey),
              let legacyCooldowns = decodeCooldowns(from: legacyData) else {
            return
        }

        saveCooldowns(legacyCooldowns)
        legacyUserDefaults.removeObject(forKey: storageKey)
    }

    private func decodeCooldowns(from data: Data) -> [Cooldown]? {
        do {
            return try decoder.decode([Cooldown].self, from: data)
        } catch {
            NSLog("CoolDone: Failed to decode Cooldowns from storage: %@", String(describing: error))
            return nil
        }
    }
}
