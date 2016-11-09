//
//  AddNewTaskViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit
import CoreData

class AddNewTaskViewController: UIViewController {
    
    //MARK: - Variables
    lazy var dataSource: AddNewTastTableViewDataSource = {
        return AddNewTastTableViewDataSource(tableView: self.tableView)
    }()
    
    @IBOutlet weak var tableView: TaskManagerTableView! {
        didSet {
           self.tableView.dataSource = dataSource
           self.tableView.register(TextTableViewCell.self)
           self.tableView.register(CategoryTableViewCell.self)
           self.tableView.register(DateTableViewCell.self)
           self.tableView.delegate = self
        }
    }
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add new task".loc().uppercased()
        
    }
    
    //MARK: - Actions
    
    @IBAction func buttonPressed() {
        guard let taskTitle = UserSettings.sharedSettings.currentTaskDescription,
        let taskDate = UserSettings.sharedSettings.currentTaskDate,
        let category = UserSettings.sharedSettings.currentCategory else {
            return
        }
        let task = Task(context: CoreDataFetcher.shared.context)
        task.name = taskTitle
        task.date = taskDate as NSDate?
        task.category = category
        
        do {
            try CoreDataFetcher.shared.context.save()
        }
        catch let error {
            print("Failed save context with description: \(error.localizedDescription)")
        }
    }
    

}


extension AddNewTaskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //TODO: Should me automatic dimension 
        switch indexPath.section {
        case 0:
            return 90
        case 1:
            return 216
        case 2:
            return 54
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            ApplicationNavigator.sharedInstance.navigate(to: .newCategory)
        }
    }
}
