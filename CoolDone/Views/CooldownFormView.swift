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

    private let durations = CooldownDuration.allCases
    private let formBackgroundColor = Color(.systemGroupedBackground)

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

    private var selectedDurationIndex: Double {
        guard let index = durations.firstIndex(of: duration) else {
            return 0
        }

        return Double(index)
    }

    private var durationIndexRange: ClosedRange<Double> {
        0...Double(max(durations.count - 1, 0))
    }

    private var durationSliderBinding: Binding<Double> {
        Binding(
            get: { selectedDurationIndex },
            set: { newValue in
                let roundedIndex = Int(newValue.rounded())
                let clampedIndex = min(max(roundedIndex, 0), durations.count - 1)
                duration = durations[clampedIndex]
            }
        )
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
        Section("J’aimerais le faire tous les \(duration.label)") {
            Slider(
                value: durationSliderBinding,
                in: durationIndexRange,
                step: 1
            )
            .accessibilityLabel("Rythme")
            .accessibilityValue(duration.label)
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
                                        .foregroundStyle(formBackgroundColor)
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

#Preview("Create with duration slider") {
    CooldownFormView(onCancel: {}, onSave: { _ in })
}

#Preview("Edit with selected Cooleur") {
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
