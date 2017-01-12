//
//  UserSettings.swift
//  TaskManager
//
//  Created by Petr Kopecký on 02/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import Foundation

enum PreferedSorting: Int {
    case date = 0
    case name = 1
}

enum UserDefaultsKeys: String {
    case notification = "notification"
    case sorting = "sorting"
    case firstLaunch = "firstLaunch"
}

class UserSettings {
    static let sharedSettings = UserSettings()
    private init() {}
    let defaults = UserDefaults.standard
    
    var currentTask: Task?
    
    
    func notificationsEnabled() -> Bool {
        if let object = defaults.object(forKey: UserDefaultsKeys.notification.rawValue) as? Bool {
            return object
        }
        return true
    }
    func isFirstLaunch () -> Bool {
        if let _ = defaults.object(forKey: UserDefaultsKeys.firstLaunch.rawValue) {
            return false
        }
        defaults.set(false, forKey: UserDefaultsKeys.firstLaunch.rawValue)
        return true
    }
    
    func setNotificationsTo(enabled: Bool) {
        defaults.set(enabled, forKey: UserDefaultsKeys.notification.rawValue)
        defer {
            defaults.synchronize()
        }
    }
    func cleanCurrentTask() -> Void {
        currentTask = .none
        
    }
    
    func preferedSorting() -> PreferedSorting {
        if let object = defaults.object(forKey: UserDefaultsKeys.sorting.rawValue) as? Int {
            return PreferedSorting(rawValue: object) ?? .name
        }
        return .name
    }
    func setPreferedsorting(type: PreferedSorting) {
        defaults.set(type.rawValue, forKey: UserDefaultsKeys.sorting.rawValue)
        defer {
            defaults.synchronize()
        }
    }
    

}
