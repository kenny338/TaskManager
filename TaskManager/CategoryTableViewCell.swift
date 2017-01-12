//
//  CategoryTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class CategoryTableViewCell : UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(with category: Category) {
        categoryName.text = category.name
        categoryView.backgroundColor = UIColor.hexStringToUIColor(hex: category.hexColor ?? "")
    }
}
