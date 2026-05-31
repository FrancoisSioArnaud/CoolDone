//
//  StartTimerIntent.swift
//  CoolDownWidget
//
//  Created by François Arnaud on 31/05/2026.
//

import AppIntents

struct StartTimerIntent: SetValueIntent {
    static let title: LocalizedStringResource = "Start a timer"

    @Parameter(title: "Timer is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        // Start / stop the timer based on `value`.
        return .result()
    }
}
