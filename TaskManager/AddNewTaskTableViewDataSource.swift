//
//  AddNewTastTableViewDataSource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class AddNewTastTableViewDataSource: NSObject, UITableViewDataSource {
    //MARK: - Variables
    
    let titles = StringProvider.newTaskTitles()
    private var tableView: UITableView
    
    //MARK: - Lifecycle
    init(tableView: UITableView) {
        self.tableView = tableView
        
    }
    
    //MARK: - Uitableview Datasource

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
            cell.textView.text = UserSettings.sharedSettings.currentTask?.name ?? ""
            return cell
        case 1:
            let cell: DateTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
              cell.datePicker.setDate(UserSettings.sharedSettings.currentTask?.date as Date? ?? Date(), animated: true)
            return cell
        case 2:
            let cell: CategoryTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            if let currentCategory = UserSettings.sharedSettings.currentTask?.category {
                cell.configure(with: currentCategory)
            }
            return cell
        case 3:
            let cell: SwitchTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configure(withString: "Notify me".loc(), mode:.AddNotification)
            cell.settingsSwitch.isOn = UserSettings.sharedSettings.currentTask?.hasNotification ?? false
            return cell
        default:
            return UITableViewCell()
        
        }
    }
}

