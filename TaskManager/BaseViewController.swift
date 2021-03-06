//
//  BaseViewController.swift
//  TaskManager
//
//  Created by Petr Kopecky on 12.01.17.
//  Copyright © 2017 Petr Kopecký. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    func addTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.delegate = self
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    func tapped(recognizer: UIGestureRecognizer) {
        view.endEditing(true)
    }

    
}
