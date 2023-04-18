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

