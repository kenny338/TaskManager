//
//  BasicTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var title: UILabel!
    
    func configure(withString string: String) {
        self.title.text = string.loc().uppercased()
    }
    
}
