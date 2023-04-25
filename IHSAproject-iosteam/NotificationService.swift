//
//  NotificationService.swift
//  IHSAproject-iosteam
//
//  Created by Reason on 4/18/23.
//

import Foundation
import UserNotifications

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
        if granted {
            print("Notification permission granted")
        } else {
            print("Notification permission denied")
        }
    }
}
//Notification func 
public func sendNotification(title: String, body: String, timeInterval: TimeInterval) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
    let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)

    UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
        if let error = error {
            print("Error adding notification: \(error.localizedDescription)")
        } else {
            print("Notification added successfully")
        }
    })
}
