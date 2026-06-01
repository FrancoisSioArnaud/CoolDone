//
//  CooldownRowView.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import SwiftUI

struct CooldownRowView: View {
    let cooldown: Cooldown
    let now: Date
    let onDone: () -> Void
    let onEdit: () -> Void
    let onDelete: () -> Void

    private var progress: Double {
        ProgressCalculator.remainingRatio(for: cooldown, at: now)
    }

    private var fillColor: Color {
        let variant = ProgressCalculator.cooleurVariant(for: progress)
        return Color(hex: cooldown.cooleur.hex(for: variant))
    }

    private var trackColor: Color {
        Color(hex: cooldown.cooleur.pastelHex).opacity(0.55)
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            doneButton

            VStack(alignment: .leading, spacing: 9) {
                header
                progressBar
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background {
            Button(action: onEdit) {
                cardBackground
            }
            .buttonStyle(.plain)
            .accessibilityHidden(true)
        }
        .accessibilityElement(children: .contain)
        .accessibilityAddTraits(.isButton)
        .accessibilityAction(named: "Modifier", onEdit)
    }

    private var header: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Text(cooldown.name)
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(2)
                .minimumScaleFactor(0.85)

            Spacer(minLength: 12)

            Menu {
                Button("Modifier", action: onEdit)
                Button("Supprimer", action: onDelete)
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.title3)
                    .frame(width: 44, height: 44)
                    .contentShape(Rectangle())
            }
            .accessibilityLabel("Actions pour \(cooldown.name)")
        }
    }

    private var doneButton: some View {
        Button(action: onDone) {
            Image(systemName: "checkmark.circle.fill")
                .font(.title2.weight(.semibold))
                .foregroundStyle(fillColor)
                .frame(width: 44, height: 44)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Marquer \(cooldown.name) comme fait")
    }

    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 22, style: .continuous)
            .fill(.background)
            .shadow(color: .black.opacity(0.06), radius: 14, y: 5)
    }

    private var progressBar: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(trackColor)

                Capsule()
                    .fill(fillColor)
                    .frame(width: proxy.size.width * progress)
            }
        }
        .frame(height: 14)
        .accessibilityHidden(true)
    }
}

#Preview("Check on left, card opens edit") {
    CooldownRowView(
        cooldown: Cooldown(
            name: "Appeler maman",
            duration: .twentyThreeDays,
            cooleur: .mint,
            lastDoneAt: .now.addingTimeInterval(-2 * 24 * 60 * 60)
        ),
        now: .now,
        onDone: {},
        onEdit: {},
        onDelete: {}
    )
    .padding()
}

#Preview("Lower progress") {
    CooldownRowView(
        cooldown: Cooldown(
            name: "Jouer de la guitare",
            duration: .elevenDays,
            cooleur: .lavender,
            lastDoneAt: .now.addingTimeInterval(-10 * 24 * 60 * 60)
        ),
        now: .now,
        onDone: {},
        onEdit: {},
        onDelete: {}
    )
    .padding()
}
