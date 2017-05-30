//
//  HomeViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit
import DTTableViewManager
import DTModelStorage

class HomeViewController: UIViewController, SavingDelegate, DTTableViewManageable {
    let rowHeight: CGFloat = 91
    
    //MARK: - Variables
    
    lazy var coreDataStorage: CoreDataStorage = {
        return CoreDataStorage(fetchedResultsController: CoreDataFetcher.shared.fetchedResultsController(entity: Task.self))
    }()
    
    var shouldPerformFetch = true
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            configureManager()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if shouldPerformFetch {
            shouldPerformFetch = false
        }
    }
    
    //MARK: - Tableview manager
    func configureManager() {
        manager.startManaging(withDelegate: self)
//        addItemsToManager()
        manager.register(TaskTableViewCell.self)
        manager.storage = coreDataStorage
        
        manager.heightForCell(withItem: Task.self) {[weak self] (_, _) -> CGFloat in
            return self?.rowHeight ?? 0
        }
        manager.didSelect(TaskTableViewCell.self) { (_, currentTask, indexPath) in
            ApplicationNavigator.sharedInstance.navigate(to: .taskDetail(withDelegate: self, task: currentTask))
        }

       manager.editActions(for: TaskTableViewCell.self) { (_, currentTask, indexPath) -> [UITableViewRowAction]? in
            let rowAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: { (_, _) in
                
            })
            return [rowAction]
        }
    }
//    func addItemsToManager() {
//        if dataSource.tasks.count == 0 {
//            tableView.addNoDataView(with: "You don't have any tasks.")
//        }
//        else {
//            tableView.addNoDataView(with: nil)
//        }
//        manager.memoryStorage.addItems(dataSource.tasks)
//    }


//MARK: - UI

func configureUI() {
    let newTask = UIBarButtonItem(image: UIImage(assetID: .newTask), style: .plain, target: self, action: #selector(newTaskTapped))
    let settings = UIBarButtonItem(image: UIImage(assetID: .settings), style: .plain, target: self, action: #selector(settingsTapped))
    
    navigationController?.navigationBar.topItem?.title = "tasks".loc().uppercased()
    navigationItem.setRightBarButtonItems([newTask, settings], animated: true)
    segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
}


//MARK: - Action
func newTaskTapped() {
    ApplicationNavigator.sharedInstance.navigate(to: .newTask(withDelegate: self))
}

func segmentChanged() {
    let request = coreDataStorage.fetchedResultsController.fetchRequest
    
    switch segmentControl.selectedSegmentIndex {
    case 0:
        request.predicate = nil
    case 1:
        let predicate = NSPredicate(format: "completed == \(!Bool(segmentControl.selectedSegmentIndex as NSNumber))")
        request.predicate = predicate
        
    default: break
    }
    
    try! coreDataStorage.fetchedResultsController.performFetch()
    tableView.reloadData()
}

func settingsTapped() {
    ApplicationNavigator.sharedInstance.navigate(to: .settings)
    shouldPerformFetch = true
}

//MARK: - Saving delegate

func finishedSaving() {
    //     dataSource.fetchData()
}

}
