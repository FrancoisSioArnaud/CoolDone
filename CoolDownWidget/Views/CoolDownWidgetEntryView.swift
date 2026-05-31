//
//  CoolDownWidgetEntryView.swift
//  CoolDownWidget
//
//  Created by François Arnaud on 31/05/2026.
//

import AppIntents
import SwiftUI
import WidgetKit

struct CoolDownWidgetEntryView: View {
    @Environment(\.widgetFamily) private var widgetFamily

    var entry: CoolDownWidgetProvider.Entry

    private var visibleCooldowns: [Cooldown] {
        Array(entry.cooldowns.prefix(maxVisibleCooldowns))
    }

    private var maxVisibleCooldowns: Int {
        switch widgetFamily {
        case .systemSmall:
            return 1
        case .systemMedium:
            return 3
        default:
            return 6
        }
    }

    var body: some View {
        if entry.cooldowns.isEmpty {
            emptyState
        } else {
            cooldownList
        }
    }

    private var cooldownList: some View {
        VStack(alignment: .leading, spacing: spacing) {
            if widgetFamily != .systemSmall {
                Text("CoolDone")
                    .font(.headline)
                    .foregroundStyle(.primary)
            }

            ForEach(visibleCooldowns) { cooldown in
                CoolDownWidgetRow(cooldown: cooldown, date: entry.date)
            }

            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("CoolDone")
                .font(.headline)

            Text("Crée un Cooldown dans l’app pour le voir ici.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    private var spacing: CGFloat {
        widgetFamily == .systemLarge ? 10 : 8
    }
}

private struct CoolDownWidgetRow: View {
    let cooldown: Cooldown
    let date: Date

    private var progress: Double {
        ProgressCalculator.remainingRatio(for: cooldown, at: date)
    }

    private var fillColor: Color {
        let variant = ProgressCalculator.cooleurVariant(for: progress)
        return Color(hex: cooldown.cooleur.hex(for: variant))
    }

    private var trackColor: Color {
        Color(hex: cooldown.cooleur.pastelHex).opacity(0.55)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .firstTextBaseline, spacing: 6) {
                Text(cooldown.name)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Spacer(minLength: 4)

                Button(intent: DoneCooldownIntent(cooldownID: cooldown.id.uuidString)) {
                    Text("C’est fait")
                        .font(.caption2.weight(.semibold))
                }
                .buttonStyle(.bordered)
                .controlSize(.mini)
                .accessibilityLabel("Marquer \(cooldown.name) comme fait")
            }

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(trackColor)

                    Capsule()
                        .fill(fillColor)
                        .frame(width: proxy.size.width * progress)
                }
            }
            .frame(height: 8)
            .accessibilityHidden(true)
        }
    }
}
