//
//  SettingsDataSource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class SettingsDataSource: NSObject, UITableViewDataSource {
    //TODO: More generic datasource? 4 almost same datasources
    
    let titles = StringProvider.settingsTitles()
    let sortingTitles = StringProvider.sortingtitles()
    
    private var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section != 1 else {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section != 0 else {
            return nil
        }
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: SwitchTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configure(withString:"notification", mode: .Settings)
            cell.settingsSwitch.isOn = UserSettings.sharedSettings.notificationsEnabled()
            return cell
        case 1:
            let cell: BasicTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configure(withString: sortingTitles[indexPath.row])
            if indexPath.row == UserSettings.sharedSettings.preferedSorting().rawValue {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
            return cell
   
        default:
            return UITableViewCell()
            
        }
    }
    
    
}
