//
//  CategoryListViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 07/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController, UITableViewDelegate, SavingDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataSource: CategoryDatasource = {
        return CategoryDatasource(tableView: self.tableView)
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.title = "select category".loc().uppercased()
        tableView.dataSource = dataSource
        tableView.delegate = self
        dataSource.fetchData()
        
    }
    
    //MARK: - UI
    
    private func configureUI() {

        tableView.register(CategoryTableViewCell.self)
        let addNewCategoryView: AddNewCategoryView = UIView.load()
        addNewCategoryView.delegate = self
        tableView.tableFooterView = addNewCategoryView
    }
    
    //MARK: - Saving delegate
    
    func finishedSaving() {
        dataSource.fetchData()
    }
    
    //MARK: - Tableview datasource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            UserSettings.sharedSettings.currentTask?.category = dataSource.categories[indexPath.row]
       
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }


}
