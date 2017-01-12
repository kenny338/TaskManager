//
//  CategoryDatasource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 07/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class CategoryDatasource: NSObject, UITableViewDataSource, Fetchable {
    private var tableView: UITableView
    var categories: [Category] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    //MARK: - Fetchable

     func fetchData() {
        CoreDataFetcher.shared.fetchCategories {[weak self] (result) in
            if let weakSelf = self {
                weakSelf.categories = result ?? []
            }
        }
    }
    
    //MARK: - Tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "New category".loc()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoryTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let category = categories[indexPath.row]
        cell.configure(with: category)
        if let currentCategory = UserSettings.sharedSettings.currentTask?.category, currentCategory == category {
            cell.accessoryType = .checkmark
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
        }
        return cell
    }
    
    
}
