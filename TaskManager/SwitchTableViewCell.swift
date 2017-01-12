//
//  SwitchTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

enum SwitchMode {
    case Settings
    case AddNotification
}

class SwitchTableViewCell : UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    
    func configure(withString string: String, mode:SwitchMode) {
        self.title.text = string.loc().uppercased()
        switch mode {
        case .Settings:
            settingsSwitch.addTarget(self, action: #selector(SwitchTableViewCell.switchChangedNotficiation), for: .valueChanged)
        
        case .AddNotification:
            settingsSwitch.addTarget(self, action: #selector(SwitchTableViewCell.switchChangedNotifyAboutTask), for: .valueChanged)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func switchChangedNotficiation() {
            UserSettings.sharedSettings.setNotificationsTo(enabled: settingsSwitch.isOn)
            if !settingsSwitch.isOn {
            NotificationHelper.cancelAllNotifications()
        }
        }
    func switchChangedNotifyAboutTask() {
        UserSettings.sharedSettings.currentTask?.hasNotification = settingsSwitch.isOn
        if settingsSwitch.isOn {
            NotificationHelper.notificationFor(task: UserSettings.sharedSettings.currentTask)
        }
        else {
            NotificationHelper.turnOffNotificationFor(task: UserSettings.sharedSettings.currentTask)
        }
        
    }
    
}
