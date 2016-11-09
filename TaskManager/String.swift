//
//  String.swift
//  DogCalendar
//
//  Created by Petr Kopecký on 22/10/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import Foundation

extension String {
    func loc(comment: String = "") ->String {
        return NSLocalizedString(self, comment: comment)
    }
}
