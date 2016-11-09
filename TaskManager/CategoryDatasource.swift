//
//  CategoryDatasource.swift
//  TaskManager
//
//  Created by Petr Kopecký on 07/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class CategoryDatasource: NSObject, UITableViewDataSource {
    private var tableView: UITableView
    var categories: [Category] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }

     func fetchData() {
        CoreDataFetcher.shared.fetchCategories {[weak self] (result) in
            if let weakSelf = self {
                weakSelf.categories = result ?? []
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "New category".loc()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CategoryTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: categories[indexPath.row])
        return cell
    }
    
    
}
