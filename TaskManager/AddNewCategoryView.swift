//
//  AddNewCategoryView.swift
//  TaskManager
//
//  Created by Petr Kopecký on 08/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit
import KKColorListPicker

protocol SavingDelegate: NSObjectProtocol {
    func finishedSaving()
}

class AddNewCategoryView: UIView, NibLoadableView {
    
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryTitle: UITextField!
    weak var delegate: SavingDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func saveButtonPressed() {
        delegate?.finishedSaving()
    //    let vc = KKColorListViewController(schemeType: .pantone)
        
    //    ApplicationNavigator.sharedInstance.getRootController()?.present(vc!, animated: true, completion: nil)
   //
    }
}
