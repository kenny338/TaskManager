//
//  TasksDataSource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 02/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TasksDataSource: NSObject, UITableViewDataSource {
    
    private var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TaskTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    
}
