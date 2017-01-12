//
//  AddNewTaskViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit
import CoreData


class AddNewTaskViewController: BaseViewController {
    
    //MARK: - Variables
    lazy var dataSource: AddNewTastTableViewDataSource = {
        return AddNewTastTableViewDataSource(tableView: self.tableView)
    }()
    weak var delegate: SavingDelegate?
    var editableTask: Task? = nil
    
    @IBOutlet weak var tableView: TaskManagerTableView! {
        didSet {
           self.tableView.dataSource = dataSource
           self.tableView.register(TextTableViewCell.self)
           self.tableView.register(CategoryTableViewCell.self)
           self.tableView.register(DateTableViewCell.self)
           self.tableView.register(SwitchTableViewCell.self)
           self.tableView.delegate = self
           self.tableView.separatorStyle = .none
       
        }
    }
    //MARK: - Lifecycle
    
    convenience init(withDelegate:SavingDelegate, editableTask:Task? = nil) {
        self.init()
        self.delegate = withDelegate
        self.editableTask = editableTask
        if editableTask != nil {
            self.editableTask = editableTask
            UserSettings.sharedSettings.currentTask = self.editableTask
        }
        else {
            UserSettings.sharedSettings.currentTask = Task(context: CoreDataFetcher.shared.context)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadRows(at: [IndexPath(row: 0, section: 2)], with: .automatic)
    }
    
    //MARK: - UI
    
    func configureUI() {
        let title = editableTask == nil ? "add new task" : "edit task"
        self.title = title.loc().uppercased()
    }
    //MARK: - Setup
    func setup() {
        navigationController?.delegate = self
        addTap()
    }
    
    //MARK: - Saving
    
    func saveTask() {
        view.endEditing(true)
        guard let task  = UserSettings.sharedSettings.currentTask else { return }
        if task.name?.isEmpty ?? true || task.date == nil || task.category == nil {
            return
        }
        CoreDataFetcher.shared.save()
        UserSettings.sharedSettings.cleanCurrentTask()
    }
    
    //MARK: - Actions
    
    
    @IBAction func buttonPressed() {
       saveTask()
       ApplicationNavigator.sharedInstance.navigate(to: .home)
    }
}

extension AddNewTaskViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is HomeViewController {
            saveTask()
            delegate?.finishedSaving()
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
            return 60
        case 3:
            return 40
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
