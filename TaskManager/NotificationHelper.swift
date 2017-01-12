//
//  NotificationHelper.swift
//  TaskManager
//
//  Created by Petr Kopecký on 11/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class NotificationHelper {
    static func notificationFor(task:Task?) {
        guard let task = task else {return}
        let notification = UILocalNotification()
        notification.alertBody = "Task \(task.name ?? "")"
        notification.fireDate = task.date as? Date
        
        let someRandomID =  Int64(Date().timeIntervalSince1970 * 1000)
        notification.userInfo = ["id": someRandomID]
        task.notificationID = someRandomID
        CoreDataFetcher.shared.save()
        
        UIApplication.shared.scheduleLocalNotification(notification)
    }
    static func turnOffNotificationFor(task: Task?) {
        guard let _ = task else {return}
        let scheduledNotifications: [UILocalNotification]? = UIApplication.shared.scheduledLocalNotifications
        guard scheduledNotifications != nil else {return}
        
        for notification in scheduledNotifications! {
            if notification.userInfo!["id"] as? Int64 == task?.notificationID {
                UIApplication.shared.cancelLocalNotification(notification)
                task?.hasNotification = false
                CoreDataFetcher.shared.save()
            }
        }
        
    }
    static func cancelAllNotifications() {
        let scheduledNotifications: [UILocalNotification]? = UIApplication.shared.scheduledLocalNotifications
        guard scheduledNotifications != nil else {return}
        
        for notification in scheduledNotifications! {
            UIApplication.shared.cancelLocalNotification(notification)
        }
        
        CoreDataFetcher.shared.fetchTasks(sorting: .date, completionBlock: { (tasks) in
            if let fetchedTasks = tasks {
                for task in fetchedTasks {
                    task.hasNotification = false
                }
            }
        })
            CoreDataFetcher.shared.save()
    }
    
    
}


