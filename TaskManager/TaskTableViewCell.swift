//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 02/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit
import DTTableViewManager
import DTModelStorage

class TaskTableViewCell : UITableViewCell, ReusableView, NibLoadableView, ModelTransfer {

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var checkMarkImageView: UIImageView!
    var currentTask: Task?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        addGestureRecognizer()
    }
    //MARK: - UI
    func update(with model: Task) {
        currentTask = model
        categoryView.backgroundColor = UIColor.hexStringToUIColor(hex: model.category?.hexColor ?? "")
        title.text = model.name
        finishLabel.text? = "Finish until \((model.date as? Date ?? Date()).toString())"
        configureCheckmarkImage()
     }
    func configureCheckmarkImage() {
           checkMarkImageView.image = currentTask!.completed ? UIImage(assetID: .checked) : UIImage(assetID: .notChecked)
    }
    
    
    //MARK: - gesture
    func addGestureRecognizer() {
        checkMarkImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TaskTableViewCell.checkboxTapped)))
    }
    
    @IBAction func checkboxTapped() {
        currentTask?.completed = !currentTask!.completed
        CoreDataFetcher.shared.save()
        configureCheckmarkImage()
        
    }
}
