//
//  SettingsViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    lazy var dataSource: SettingsDataSource = {
        return SettingsDataSource(tableView: self.tableView)
    }()
    
    @IBOutlet weak var tableView: TaskManagerTableView! {
        didSet {
            self.tableView.dataSource = dataSource
            self.tableView.register(SwitchTableViewCell.self)
            self.tableView.register(BasicTableViewCell.self)
            self.tableView.delegate = self
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "settings".loc().uppercased()
    }
}
extension SettingsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            UserSettings.sharedSettings.setPreferedsorting(type: PreferedSorting(rawValue: indexPath.row) ?? PreferedSorting.date)
            tableView.reloadData()
        }
    }
}
