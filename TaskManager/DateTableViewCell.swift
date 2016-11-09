//
//  DateTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class DateTableViewCell : UITableViewCell, ReusableView, NibLoadableView {
    @IBOutlet weak var datePicker: UIDatePicker!
    
}
