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
    private enum Keys {
        static let cooldowns = "cooldone.cooldowns.v0"
    }

    private let userDefaults: UserDefaults
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    init(
        userDefaults: UserDefaults = .standard,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.userDefaults = userDefaults
        self.encoder = encoder
        self.decoder = decoder
    }

    func loadCooldowns() -> [Cooldown] {
        guard let data = userDefaults.data(forKey: Keys.cooldowns) else {
            return []
        }

        do {
            return try decoder.decode([Cooldown].self, from: data)
        } catch {
            return []
        }
    }

    func saveCooldowns(_ cooldowns: [Cooldown]) {
        do {
            let data = try encoder.encode(cooldowns)
            userDefaults.set(data, forKey: Keys.cooldowns)
        } catch {
            return
        }
    }
}
