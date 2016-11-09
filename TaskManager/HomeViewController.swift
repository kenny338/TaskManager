//
//  HomeViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let headerHeight: CGFloat = 91
    
    lazy var dataSource: TasksDataSource = {
        return TasksDataSource(tableView: self.tableView)
    }()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = dataSource
            self.tableView.register(TaskTableViewCell.self)
            self.tableView.delegate = self
            self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    //MARK: - UI
    
    func configure() {
        let newTask = UIBarButtonItem(image: UIImage(assetID: .newTask), style: .plain, target: self, action: #selector(newTaskTapped))
        let settings = UIBarButtonItem(image: UIImage(assetID: .settings), style: .plain, target: self, action: #selector(settingsTapped))
        
        navigationController?.navigationBar.topItem?.title = "tasks".loc().uppercased()
        navigationItem.setRightBarButtonItems([newTask, settings], animated: true)
    }
    
    
    //MARK: - Action
    func newTaskTapped() {
        ApplicationNavigator.sharedInstance.navigate(to: .newTask)
    }
    
    func settingsTapped() {
        ApplicationNavigator.sharedInstance.navigate(to: .settings)
    }

}

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return headerHeight
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}
