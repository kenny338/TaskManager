//
//  SwitchTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class SwitchTableViewCell : UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    
    func configure(withString string: String) {
        self.title.text = string.loc().uppercased()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        settingsSwitch.addTarget(self, action: #selector(SwitchTableViewCell.switchChanged), for: .valueChanged)
    }
    
    func switchChanged() {
            UserSettings.sharedSettings.setNotificationsTo(enabled: settingsSwitch.isOn)
        }
    
}
