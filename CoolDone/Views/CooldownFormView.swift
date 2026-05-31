//
//  CooldownFormView.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import SwiftUI

struct CooldownFormView: View {
    private let cooldown: Cooldown?
    private let onCancel: () -> Void
    private let onSave: (Cooldown) -> Void

    @State private var name: String
    @State private var duration: CooldownDuration
    @State private var cooleur: Cooleur
    @State private var notificationsEnabled: Bool
    @State private var notificationPermissionDenied = false

    private var trimmedName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private var isEditing: Bool {
        cooldown != nil
    }

    private var canSave: Bool {
        !trimmedName.isEmpty
    }

    init(
        cooldown: Cooldown? = nil,
        onCancel: @escaping () -> Void,
        onSave: @escaping (Cooldown) -> Void
    ) {
        self.cooldown = cooldown
        self.onCancel = onCancel
        self.onSave = onSave

        _name = State(initialValue: cooldown?.name ?? "")
        _duration = State(initialValue: cooldown?.duration ?? .threeDays)
        _cooleur = State(initialValue: cooldown?.cooleur ?? .mint)
        _notificationsEnabled = State(initialValue: cooldown?.notificationsEnabled ?? false)
    }

    var body: some View {
        NavigationStack {
            Form {
                nameSection
                durationSection
                cooleurSection
                notificationSection
            }
            .onChange(of: notificationsEnabled) { _, isEnabled in
                guard isEnabled else {
                    notificationPermissionDenied = false
                    return
                }

                requestNotificationAuthorization()
            }
            .navigationTitle(isEditing ? "Modifier" : "Nouveau Cooldown")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler", action: onCancel)
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button(isEditing ? "Enregistrer" : "Créer", action: save)
                        .disabled(!canSave)
                }
            }
        }
    }

    private var nameSection: some View {
        Section {
            TextField("Nom", text: $name)
                .textInputAutocapitalization(.sentences)
                .submitLabel(.done)
        } header: {
            Text("Nom")
        } footer: {
            if !canSave {
                Text("Le nom est obligatoire.")
            }
        }
    }

    private var durationSection: some View {
        Section("Rythme") {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 82), spacing: 10)], spacing: 10) {
                ForEach(CooldownDuration.allCases) { option in
                    Button {
                        duration = option
                    } label: {
                        Text(option.label)
                            .font(.subheadline.weight(.semibold))
                            .frame(maxWidth: .infinity, minHeight: 38)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(duration == option ? .white : .primary)
                    .background(durationBackground(for: option))
                    .accessibilityLabel(option.label)
                    .accessibilityValue(duration == option ? "Sélectionné" : "")
                }
            }
            .padding(.vertical, 4)
        }
    }

    private var cooleurSection: some View {
        Section("Cooleur") {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 88), spacing: 12)], spacing: 12) {
                ForEach(Cooleur.allCases) { option in
                    Button {
                        cooleur = option
                    } label: {
                        VStack(spacing: 8) {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: option.brightHex))
                                    .frame(width: 34, height: 34)

                                if cooleur == option {
                                    Image(systemName: "checkmark")
                                        .font(.caption.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                            }

                            Text(option.displayName)
                                .font(.caption)
                                .lineLimit(1)
                                .minimumScaleFactor(0.75)
                        }
                        .frame(maxWidth: .infinity, minHeight: 74)
                    }
                    .buttonStyle(.plain)
                    .padding(8)
                    .background(cooleurBackground(for: option))
                    .accessibilityLabel(option.displayName)
                    .accessibilityValue(cooleur == option ? "Sélectionnée" : "")
                }
            }
            .padding(.vertical, 4)
        }
    }

    private func durationBackground(for option: CooldownDuration) -> some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(duration == option ? Color(hex: cooleur.darkHex) : Color(.secondarySystemGroupedBackground))
    }

    private func cooleurBackground(for option: Cooleur) -> some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(cooleur == option ? Color(hex: option.pastelHex) : Color(.secondarySystemGroupedBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(cooleur == option ? Color(hex: option.darkHex) : .clear, lineWidth: 2)
            )
    }

    private var notificationSection: some View {
        Section {
            Toggle("Me prévenir à la fin du cycle", isOn: $notificationsEnabled)
        } header: {
            Text("Notification")
        } footer: {
            if notificationPermissionDenied {
                Text("Les notifications ne sont pas autorisées pour le moment.")
            }
        }
    }

    private func requestNotificationAuthorization() {
        Task {
            let isAuthorized = await CooldownNotificationScheduler().requestAuthorization()

            guard !isAuthorized else {
                return
            }

            await MainActor.run {
                notificationsEnabled = false
                notificationPermissionDenied = true
            }
        }
    }

    private func save() {
        guard canSave else {
            return
        }

        let savedCooldown = Cooldown(
            id: cooldown?.id ?? UUID(),
            name: trimmedName,
            duration: duration,
            cooleur: cooleur,
            lastDoneAt: cooldown?.lastDoneAt ?? Date(),
            notificationsEnabled: notificationsEnabled
        )

        onSave(savedCooldown)
    }
}

#Preview("Create") {
    CooldownFormView(onCancel: {}, onSave: { _ in })
}

#Preview("Edit") {
    CooldownFormView(
        cooldown: Cooldown(
            name: "Appeler maman",
            duration: .twentyThreeDays,
            cooleur: .mint,
            notificationsEnabled: true
        ),
        onCancel: {},
        onSave: { _ in }
    )
}
