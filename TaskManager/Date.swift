//
//  Date.swift
//  DogCalendar
//
//  Created by Petr Kopecký on 21/10/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import Foundation

extension Date {
    
    //MARK: - Public
    static func dateFrom(day: Int, month: Int) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        return formatter.date(from: "\(month)-\(day)") ?? Date()
    }
    
    static func tommorowDate() -> Date {
        var date = Date()
        date.addTimeInterval(86400)
        return date
    }
    
    static func localizedMonth(forMonthNumber: Int) -> String {
        let formatter = DateFormatter()
        return formatter.monthSymbols[forMonthNumber]
    }
     func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter.string(from: self)
    }
    
     func monthFromDate() -> Int {
        let components = Date.currentCalendar()?.components(in: NSTimeZone.local, from: self)
        
        return components?.month ?? 0
    }
    func dayFromDate() -> Int {
        let components = Date.currentCalendar()?.components(in: NSTimeZone.local, from: self)
        
        return components?.day ?? 0
    }
    
    static func isDateEqualfor(date: Date) -> Bool {
        if let currentDateComponents = dateComponents(), let comparable =  currentCalendar()?.components(in: NSTimeZone.local, from: date) {
            return currentDateComponents.month! == comparable.month! &&
            currentDateComponents.day! == comparable.day!
        }
        return false
    }
    
    //MARK: - Helpers
    static func dateComponents() -> DateComponents? {
        return currentCalendar()?.components(in: NSTimeZone.local, from: Date())
    }
    static func currentCalendar() -> NSCalendar? {
        return NSCalendar(identifier: NSCalendar.Identifier.gregorian)
    }
    
}
