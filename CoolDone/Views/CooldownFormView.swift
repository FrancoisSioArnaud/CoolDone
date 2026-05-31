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
        _notificationsEnabled = State(initialValue: cooldown?.notificationsEnabled ?? true)
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
        Section("J’aimerais le faire tous les...") {
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
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(Cooleur.allCases) { option in
                        Button {
                            cooleur = option
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color(hex: option.brightHex))
                                    .frame(width: 38, height: 38)

                                if cooleur == option {
                                    Image(systemName: "checkmark")
                                        .font(.caption.weight(.bold))
                                        .foregroundStyle(.white)
                                }
                            }
                            .frame(width: 44, height: 44)
                            .contentShape(Circle())
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel(option.displayName)
                        .accessibilityValue(cooleur == option ? "Sélectionnée" : "")
                    }
                }
                .padding(.vertical, 4)
            }
            .scrollClipDisabled()
        }
    }

    private func durationBackground(for option: CooldownDuration) -> some View {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
            .fill(duration == option ? Color(hex: cooleur.darkHex) : Color(.secondarySystemGroupedBackground))
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

#Preview("Create with horizontal Cooleurs") {
    CooldownFormView(onCancel: {}, onSave: { _ in })
}

#Preview("Edit with week duration") {
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
