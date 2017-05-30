//
//  Category+CoreDataProperties.swift
//  
//
//  Created by Petr Kopecky on 30.05.17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var hexColor: String?
    @NSManaged public var name: String?
    @NSManaged public var tasksInCategory: NSSet?

}

// MARK: Generated accessors for tasksInCategory
extension Category {

    @objc(addTasksInCategoryObject:)
    @NSManaged public func addToTasksInCategory(_ value: Task)

    @objc(removeTasksInCategoryObject:)
    @NSManaged public func removeFromTasksInCategory(_ value: Task)

    @objc(addTasksInCategory:)
    @NSManaged public func addToTasksInCategory(_ values: NSSet)

    @objc(removeTasksInCategory:)
    @NSManaged public func removeFromTasksInCategory(_ values: NSSet)

}
