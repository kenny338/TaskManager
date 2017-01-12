//
//  TasksDataSource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 02/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TasksDataSource: NSObject, UITableViewDataSource, Fetchable {
    
    private var tableView: UITableView
    var tasks: [Task] = [] {
        didSet {
            showNoTasksView(show: tasks.isEmpty)
            tableView.reloadData()
        }
    }
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    //MARK: - Fetchable
    
    func fetchData() {
        CoreDataFetcher.shared.fetchTasks(sorting: UserSettings.sharedSettings.preferedSorting(), completionBlock: {[weak self] (results) in
        if let weakSelf = self {
            weakSelf.tasks = results ?? []
            }}
        )
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
    
    //MARK: - Helper method's
    
    func showNoTasksView(show: Bool) {
        if show {
            let view: NoTasksView = UIView.load()
            tableView.backgroundView = view
        }
        else {
            tableView.backgroundView = nil
        }
    }
    
    //MARK: - Tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: tasks[indexPath.row])
        return cell
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
