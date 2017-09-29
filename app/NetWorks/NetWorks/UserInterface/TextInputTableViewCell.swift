//
//  TextInputTableViewCell.swift
//  NetWorks
//
//  Created by Jupiter on 22/5/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit

class TextInputTableViewCell: UITableViewCell, UITextFieldDelegate {
	
	@IBOutlet weak var textField: UITextField!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
