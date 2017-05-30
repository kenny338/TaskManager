//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Petr Kopecky on 30.05.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var date: NSDate?
    @NSManaged public var hasNotification: Bool
    @NSManaged public var name: String?
    @NSManaged public var notificationID: Int64
    @NSManaged public var category: Category?

}
