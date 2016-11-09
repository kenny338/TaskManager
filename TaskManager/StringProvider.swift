//
//  StringProvider.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import Foundation

class StringProvider {
    
    static func settingsTitles() -> [String] {
        return mapped(toMap: ["notifications", "sorting"])
    }
    
    static func newTaskTitles() -> [String] {
        return mapped(toMap: ["description", "finish until", "category"])
    }
    static func sortingtitles() -> [String] {
        return mapped(toMap: ["by date", "by name"])
    }
    static func segmentTitles() -> [String] {
        return mapped(toMap: ["Unfinished", "Completed", "Missed"])
    }
    
    static func mapped(toMap: [String]) -> [String] {
        let mapped = toMap.map { (string) -> String in
            return string.loc().uppercased()
        }
        return mapped
    }
}
