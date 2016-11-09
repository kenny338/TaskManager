//
//  TaskManagerNavigationController.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TaskManagerNavigationController: UINavigationController {
    
    init(withViewControllers viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    //MARK: - UI
    
    func configure() {
        self.navigationBar.barTintColor = UIColor.yellow
        self.navigationBar.tintColor = UIColor.gray
    }
    
  

}

