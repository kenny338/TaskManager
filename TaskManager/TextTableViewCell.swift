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
    
    func hideHintLabel() {
          hintLabel.isHidden = textView.text.isEmpty ? false : true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.delegate = self
        hideHintLabel()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        hintLabel.isHidden = true
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        hideHintLabel()
    }
    
}
