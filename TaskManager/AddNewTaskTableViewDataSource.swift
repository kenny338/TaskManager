//
//  AddNewTastTableViewDataSource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class AddNewTastTableViewDataSource: NSObject, UITableViewDataSource {
    let titles = StringProvider.newTaskTitles()
    private var tableView: UITableView
    init(tableView: UITableView) {
        self.tableView = tableView
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
       return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: TextTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        case 1:
            let cell: DateTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        case 2:
            let cell: CategoryTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        
        }
    }
}

