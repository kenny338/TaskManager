//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 02/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TaskTableViewCell : UITableViewCell, ReusableView, NibLoadableView {

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
    func configure(with task: Task) {
        currentTask = task
        categoryView.backgroundColor = UIColor.hexStringToUIColor(hex: task.category?.hexColor ?? "")
        title.text = task.name
        finishLabel.text? = "Finish until \((task.date as? Date ?? Date()).toString())"
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
