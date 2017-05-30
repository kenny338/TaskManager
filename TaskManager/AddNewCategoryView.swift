//
//  AddNewCategoryView.swift
//  TaskManagerAddNewCategoryView
//
//  Created by Petr Kopecký on 08/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit


class AddNewCategoryView: UIView, NibLoadableView {
    
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryTitle: UITextField!
    weak var delegate: SavingDelegate?
    
   
    //MARK: - Actions
    
    @IBAction func saveButtonPressed() {
        if !categoryTitle.text!.isEmpty {
            if #available(iOS 10.0, *) {
                let category = Category(context: CoreDataFetcher.shared.context)
                category.name = categoryTitle.text ?? ""
                category.hexColor = categoryView.backgroundColor?.toHexString()
                CoreDataFetcher.shared.save()
                delegate?.finishedSaving()
                clean()
            } else {
                // demo example, no need support for iOS 9
            }
            
        }
     
    }
    @IBAction func openColorPalleteButtonPressed(_ sender: UITapGestureRecognizer) {
        if let vc = ApplicationNavigator.sharedInstance.getRootController()?.viewControllers.last {
        
        }
        
    }
    
    //MARK: - RappleColorPicker delegate

    func clean() {
        categoryTitle.text = ""
        categoryTitle.resignFirstResponder()
    }
}
