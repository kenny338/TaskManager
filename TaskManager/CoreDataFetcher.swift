//
//  CoreDataFetcher.swift
//  TaskManager
//
//  Created by Petr Kopecký on 04/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit
import CoreData


class CoreDataFetcher {
    
    static let shared = CoreDataFetcher()
    private init() {
        if UserSettings.sharedSettings.isFirstLaunch() {
            loadDefaultCategories()
        }
    }
    
    lazy var context: NSManagedObjectContext = {
         let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext

    }()
    
    func fetchTasks(sorting: PreferedSorting, completionBlock:([Task]?) -> ()) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        var sortDescriptor = NSSortDescriptor()
        switch sorting {
        case .date:
            sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            
        case .name:
            sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        }
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let fetched = try context.fetch(request)
            completionBlock(fetched.filter({ (task) -> Bool in
                return !(task.name?.isEmpty ?? true)
            }))
        }
        catch {
            print("Error performing fetch \(error.localizedDescription)")
        }

    }
    
    func fetchCategories(completionBlock:([Category]?) -> ()) {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            let fetched = try context.fetch(request)
            completionBlock(fetched)
        }
        catch {
            print("Error performing fetch \(error.localizedDescription)")
        }
    }
  
    
    
    func removeTask(task:Task) {
        context.delete(task)
    }
    
    func addOrEditCategory(category:Category) {
        
    }
    
    func save() {
        do {
            if context.hasChanges {
                try context.save()
            }
        }
        catch let error {
            print("Failed saved context with error: \(error.localizedDescription)")
        }
    }
    
    func getCategories() -> [Category] {
        return []
    }
    
    private func loadDefaultCategories() {
        if let plist = Bundle.main.path(forResource: "DefaultCategories", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: plist) {
                for (key, value) in dict {
                    let category = Category(context: context)
                    category.name = key as? String
                    category.hexColor = value as? String
                }
                save()
            }
        }
    }
    


}
