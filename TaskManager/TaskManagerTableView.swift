//
//  TaskManagerTableView.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TaskManagerTableView : UITableView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isScrollEnabled = false
        self.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
}
