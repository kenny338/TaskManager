//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 02/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TaskTableViewCell : UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var checkMarkImageView: UIImageView!
    
}
