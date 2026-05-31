//
//  CooldownListView.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import SwiftUI

struct CooldownListView: View {
    @State private var store: CooldownStore
    @State private var isPresentingCreation = false
    @State private var editedCooldown: Cooldown?
    @State private var cooldownPendingDeletion: Cooldown?

    init(store: CooldownStore = CooldownStore()) {
        _store = State(initialValue: store)
    }

    var body: some View {
        TimelineView(.periodic(from: .now, by: 60)) { context in
            NavigationStack {
                Group {
                    if store.cooldowns.isEmpty {
                        emptyState
                    } else {
                        cooldownList(now: context.date)
                    }
                }
                .navigationTitle("CoolDone")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: showCreationForm) {
                            Label("Ajouter", systemImage: "plus")
                        }
                        .accessibilityLabel("Ajouter un Cooldown")
                    }
                }
            }
            .sheet(isPresented: $isPresentingCreation) {
                CooldownFormView(
                    onCancel: { isPresentingCreation = false },
                    onSave: createCooldown
                )
            }
            .sheet(item: $editedCooldown) { cooldown in
                CooldownFormView(
                    cooldown: cooldown,
                    onCancel: { editedCooldown = nil },
                    onSave: updateCooldown
                )
            }
            .confirmationDialog(
                "Supprimer ce Cooldown ?",
                isPresented: deletionConfirmationBinding,
                titleVisibility: .visible
            ) {
                Button("Supprimer", action: deletePendingCooldown)
                Button("Annuler", role: .cancel) {
                    cooldownPendingDeletion = nil
                }
            }
        }
    }

    private var emptyState: some View {
        ContentUnavailableView {
            Label("Aucun Cooldown", systemImage: "sparkles")
        } description: {
            Text("Ajoute un premier rythme doux pour le retrouver ici.")
        } actions: {
            Button("Ajouter un Cooldown", action: showCreationForm)
                .buttonStyle(.borderedProminent)
                .accessibilityLabel("Ajouter un Cooldown")
        }
    }

    private func cooldownList(now: Date) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 14) {
                Text("Des petits rythmes, sans pression.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 2)

                ForEach(store.sortedCooldowns) { cooldown in
                    CooldownRowView(
                        cooldown: cooldown,
                        now: now,
                        onDone: { store.markDone(id: cooldown.id) },
                        onEdit: { editedCooldown = cooldown },
                        onDelete: { cooldownPendingDeletion = cooldown }
                    )
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .background(Color(.systemGroupedBackground))
    }

    private var deletionConfirmationBinding: Binding<Bool> {
        Binding(
            get: { cooldownPendingDeletion != nil },
            set: { isPresented in
                if !isPresented {
                    cooldownPendingDeletion = nil
                }
            }
        )
    }

    private func showCreationForm() {
        isPresentingCreation = true
    }

    private func createCooldown(_ cooldown: Cooldown) {
        store.addCooldown(cooldown)
        isPresentingCreation = false
    }

    private func updateCooldown(_ cooldown: Cooldown) {
        store.updateCooldown(cooldown)
        editedCooldown = nil
    }

    private func deletePendingCooldown() {
        guard let cooldownPendingDeletion else {
            return
        }

        store.deleteCooldown(id: cooldownPendingDeletion.id)
        self.cooldownPendingDeletion = nil
    }
}

private struct PreviewCooldownStorage: CooldownStorageProtocol {
    let cooldowns: [Cooldown]

    func loadCooldowns() -> [Cooldown] {
        cooldowns
    }

    func saveCooldowns(_ cooldowns: [Cooldown]) {}
}

@MainActor
private enum CooldownListPreviewFactory {
    static let now = Date(timeIntervalSinceReferenceDate: 800_000_000)

    static func emptyStore() -> CooldownStore {
        CooldownStore(storage: PreviewCooldownStorage(cooldowns: []), dateProvider: { now })
    }

    static func populatedStore() -> CooldownStore {
        CooldownStore(
            storage: PreviewCooldownStorage(
                cooldowns: [
                    Cooldown(
                        name: "Laver la douche",
                        duration: .twelveDays,
                        cooleur: .sage,
                        lastDoneAt: now.addingTimeInterval(-12 * 24 * 60 * 60)
                    ),
                    Cooldown(
                        name: "Jouer de la guitare",
                        duration: .elevenDays,
                        cooleur: .lavender,
                        lastDoneAt: now.addingTimeInterval(-8 * 24 * 60 * 60)
                    ),
                    Cooldown(
                        name: "Appeler maman",
                        duration: .twentyThreeDays,
                        cooleur: .mint,
                        lastDoneAt: now.addingTimeInterval(-4 * 24 * 60 * 60)
                    )
                ]
            ),
            dateProvider: { now }
        )
    }
}

#Preview("Empty list") {
    CooldownListView(store: CooldownListPreviewFactory.emptyStore())
}

#Preview("Example cooldowns") {
    CooldownListView(store: CooldownListPreviewFactory.populatedStore())
}
