//
//  TasksDataSource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 02/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TasksDataSource: NSObject, Fetchable {
    
    var tasks: [Task] = [] {
        didSet {
            //showNoTasksView(show: tasks.isEmpty)
  
        }
    }
    
    
    //MARK: - Fetchable
    
    func fetchData() {
//        CoreDataFetcher.shared.fetchTasks(sorting: UserSettings.sharedSettings.preferedSorting(), completionBlock: {[weak self] (results) in
//        if let weakSelf = self {
//            weakSelf.tasks = results ?? []
//            }}
//        )
    }
    
    func filterData(onlyNotCompleted: Bool = false) {
        if onlyNotCompleted {
            tasks = tasks.filter({ (task) -> Bool in
                return !task.completed
            })
        }
        else {
            fetchData()
        }
    }
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = tasks[indexPath.row]
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
            CoreDataFetcher.shared.removeTask(task: taskToDelete)
            CoreDataFetcher.shared.save()
        }
    }
    
}
