//
//  TextTableViewCell.swift
//  TaskManager
//
//  Created by Petr Kopecký on 01/11/2016.
//  Copyright © 2016 Petr Kopecký. All rights reserved.
//

import UIKit

class TextTableViewCell : UITableViewCell, ReusableView, NibLoadableView, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var hintLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
        hintLabel.isHidden = !(UserSettings.sharedSettings.currentTask?.name?.isEmpty ?? true)
        selectionStyle = .none
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        hintLabel.isHidden = true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        hintLabel.isHidden = textView.text.isEmpty ? false : true
        UserSettings.sharedSettings.currentTask?.name = textView.text
    }
    
}
