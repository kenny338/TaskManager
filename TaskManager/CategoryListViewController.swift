//
//  CategoryListViewController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 07/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataSource: CategoryDatasource = {
        return CategoryDatasource(tableView: self.tableView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.dataSource = dataSource
        tableView.delegate = self
        dataSource.fetchData()
        
    }
    
    private func configureUI() {

        tableView.register(CategoryTableViewCell.self)
        let addNewCategoryView: AddNewCategoryView = UIView.load()
        tableView.tableFooterView = addNewCategoryView
    }


}
