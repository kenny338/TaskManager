//
//  UIImage.swift
//  DogCalendar
//
//  Created by Petr Kopecký on 19/10/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

extension UIImage {
    enum assetID: String {
        case newTask = "newTask"
        case settings = "settings"
        case checked = "checked"
        case notChecked = "notChecked"
    }
    convenience init(assetID: assetID) {
        self.init(named: assetID.rawValue)!
    }
}
