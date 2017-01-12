//
//  ApplicationNavigator.swift
//  DogCalendar
//
//  Created by Petr Kopecký on 19/10/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

enum NavigatorPath {
    case home
    case settings
    case newTask(withDelegate: SavingDelegate)
    case taskDetail(withDelegate: SavingDelegate, task: Task)
    case newCategory
}

class ApplicationNavigator {
    static let sharedInstance = ApplicationNavigator()
    
    func initApplication(withLaunchOptions:[UIApplicationLaunchOptionsKey: Any]?) {
        createRootController()
    }
    
    
    func getRootController() -> UINavigationController? {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            return rootVC
        }
        return nil
    }
    
    func createRootController() {
        if let window = UIApplication.shared.delegate?.window {
            let homeVC = HomeViewController()
            let navigationController = TaskManagerNavigationController(withViewControllers: [homeVC])
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
    
    func changeWindowControllerTo(viewControler: UIViewController, completionBlock: (() -> Void)? = nil) {
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }
        let snapshot: UIView = (window?.snapshotView(afterScreenUpdates: true))!
        viewControler.view.addSubview(snapshot);
        window?.rootViewController = viewControler
        UIView.animate(withDuration: 0.3, animations: {() in
            snapshot.layer.opacity = 0;
            snapshot.layer.transform = CATransform3DMakeTranslation(-300, 0, 0)
        }, completion: {
            (value: Bool) in
            snapshot.removeFromSuperview();
            completionBlock?()
        });
    }
    
    func navigate(to path: NavigatorPath) {
        let animated = true
        if let rootController = getRootController() {
            switch path {
            case .home:
                let homeVC = TaskManagerNavigationController(withViewControllers: [HomeViewController()])
                changeWindowControllerTo(viewControler: homeVC)
                
            case .settings:
                let settingsVC = SettingsViewController()
                rootController.pushViewController(settingsVC, animated: animated)
                
            case .newTask(let delegate):
                let newTaskVC = AddNewTaskViewController(withDelegate: delegate)
                rootController.pushViewController(newTaskVC, animated: animated)
                
            case .newCategory:
                let newCategoryVC = CategoryListViewController()
                rootController.pushViewController(newCategoryVC, animated: animated)
                
                
            case .taskDetail(let delegate, let task):
                let editVC = AddNewTaskViewController(withDelegate: delegate, editableTask: task)
                rootController.pushViewController(editVC, animated: animated)
                
            }
        }
    }
    
}
