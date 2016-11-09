//
//  ReusableView.swift
//  DogCalendar
//
//  Created by Petr Kopecký on 31/10/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
