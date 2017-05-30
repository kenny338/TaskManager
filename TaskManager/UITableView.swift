//
//  UITableView.swift
//  DogCalendar
//
//  Created by Petr Kopecký on 31/10/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//


import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
    func addNoDataView(with title: String?) {
        guard let title = title else {
            self.backgroundView = nil
            return
        }
        let view:NoDataView = UIView.load()
        view.infoLabel.text = title
        self.backgroundView = view
    }
}
