//
//  CoolDownWidget.swift
//  CoolDownWidget
//
//  Created by François Arnaud on 31/05/2026.
//

import WidgetKit
import SwiftUI

struct CoolDownWidget: Widget {
    let kind: String = "CoolDownWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CoolDownWidgetProvider()) { entry in
            if #available(iOS 17.0, *) {
                CoolDownWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                CoolDownWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("CoolDone")
        .description("Garde un œil sur tes Cooldowns.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

private let previewDate = Date(timeIntervalSinceReferenceDate: 800_000_000)

#Preview("Empty", as: .systemMedium) {
    CoolDownWidget()
} timeline: {
    CoolDownWidgetEntry(date: previewDate, cooldowns: [])
}

#Preview("Medium", as: .systemMedium) {
    CoolDownWidget()
} timeline: {
    CoolDownWidgetEntry(
        date: previewDate,
        cooldowns: CoolDownWidgetProvider.previewCooldowns(referenceDate: previewDate)
    )
}

#Preview("Large", as: .systemLarge) {
    CoolDownWidget()
} timeline: {
    CoolDownWidgetEntry(
        date: previewDate,
        cooldowns: CoolDownWidgetProvider.previewCooldowns(referenceDate: previewDate)
    )
}

#Preview("Small", as: .systemSmall) {
    CoolDownWidget()
} timeline: {
    CoolDownWidgetEntry(
        date: previewDate,
        cooldowns: CoolDownWidgetProvider.previewCooldowns(referenceDate: previewDate)
    )
}
