//
//  HomeViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, SavingDelegate {
    let rowHeight: CGFloat = 91
    
    //MARK: - Variables
    

    
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
