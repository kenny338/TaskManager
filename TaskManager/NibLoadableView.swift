//
//  NibLoadableView.swift
//  DogCalendar
//
//  Created by Petr Kopecký on 31/10/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
