//
//  UIView.swift
//  TaskManager
//
//  Created by Petr Kopecký on 08/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

extension UIView {
    static func load<T: UIView>()  -> T where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        print(T.nibName)
        return nib.instantiate(withOwner: self, options: nil)[0] as! T
    }
    
}
