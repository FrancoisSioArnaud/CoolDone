//
//  CooldownNotificationScheduler.swift
//  CoolDone
//
//  Created by François Arnaud on 31/05/2026.
//

import Foundation

#if canImport(UserNotifications)
import UserNotifications
#endif

protocol CooldownNotificationScheduling {
    func requestAuthorization() async -> Bool
    func scheduleNotification(for cooldown: Cooldown) async
    func cancelNotification(for cooldownID: Cooldown.ID)
    func cancelAllNotifications(for cooldownID: Cooldown.ID)
    func rescheduleNotification(for cooldown: Cooldown) async
}

#if canImport(UserNotifications)
struct CooldownNotificationScheduler: CooldownNotificationScheduling {
    private let center: UNUserNotificationCenter
    private let calendar: Calendar

    init(
        center: UNUserNotificationCenter = .current(),
        calendar: Calendar = .current
    ) {
        self.center = center
        self.calendar = calendar
    }

    func requestAuthorization() async -> Bool {
        do {
            return try await center.requestAuthorization(options: [.alert, .sound])
        } catch {
            return false
        }
    }

    func scheduleNotification(for cooldown: Cooldown) async {
        guard cooldown.notificationsEnabled else {
            cancelNotification(for: cooldown.id)
            return
        }

        guard notificationDate(for: cooldown) > Date() else {
            cancelNotification(for: cooldown.id)
            return
        }

        guard await ensureAuthorization() else {
            return
        }

        let content = UNMutableNotificationContent()
        content.title = "Ton Cooldown est arrivé au bout"
        content.body = "C’est peut-être le bon moment pour \(cooldown.name)."
        content.sound = .default

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: notificationDateComponents(for: cooldown),
            repeats: false
        )
        let request = UNNotificationRequest(
            identifier: notificationIdentifier(for: cooldown.id),
            content: content,
            trigger: trigger
        )

        do {
            try await center.add(request)
        } catch {
            return
        }
    }

    func cancelNotification(for cooldownID: Cooldown.ID) {
        center.removePendingNotificationRequests(withIdentifiers: [notificationIdentifier(for: cooldownID)])
    }

    func cancelAllNotifications(for cooldownID: Cooldown.ID) {
        let identifier = notificationIdentifier(for: cooldownID)
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
        center.removeDeliveredNotifications(withIdentifiers: [identifier])
    }

    func rescheduleNotification(for cooldown: Cooldown) async {
        cancelNotification(for: cooldown.id)
        await scheduleNotification(for: cooldown)
    }

    func notificationDate(for cooldown: Cooldown) -> Date {
        cooldown.lastDoneAt.addingTimeInterval(cooldown.duration.timeInterval)
    }

    private func notificationDateComponents(for cooldown: Cooldown) -> DateComponents {
        calendar.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: notificationDate(for: cooldown)
        )
    }

    private func notificationIdentifier(for cooldownID: Cooldown.ID) -> String {
        "cooldone.cooldown.\(cooldownID.uuidString).completed"
    }

    private func ensureAuthorization() async -> Bool {
        let settings = await center.notificationSettings()

        switch settings.authorizationStatus {
        case .authorized, .provisional, .ephemeral:
            return true
        case .notDetermined:
            return await requestAuthorization()
        case .denied:
            return false
        @unknown default:
            return false
        }
    }
}

#else
struct CooldownNotificationScheduler: CooldownNotificationScheduling {
    private let calendar: Calendar

    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }

    func requestAuthorization() async -> Bool {
        false
    }

    func scheduleNotification(for cooldown: Cooldown) async {}

    func cancelNotification(for cooldownID: Cooldown.ID) {}

    func cancelAllNotifications(for cooldownID: Cooldown.ID) {}

    func rescheduleNotification(for cooldown: Cooldown) async {}

    func notificationDate(for cooldown: Cooldown) -> Date {
        cooldown.lastDoneAt.addingTimeInterval(cooldown.duration.timeInterval)
    }
}
#endif
