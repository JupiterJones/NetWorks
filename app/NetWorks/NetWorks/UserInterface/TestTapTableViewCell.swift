//
//  TestTapTableViewCell.swift
//  NetWorks
//
//  Created by Jupiter on 4/7/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import XCGLogger

class TestTapTableViewCell: UITableViewCell {

	static let tapIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.black, size: CGSize(width: 25, height: 25))
	
	var tap: NWTapResult?
	
	@IBOutlet weak var iconView: UIImageView!
	@IBOutlet weak var tapNumberField: UITextField!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		iconView.image = TestTapTableViewCell.tapIcon
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	@IBAction func valueUpdated(_ sender: Any) {
		log.verbose("Tap title updated to: \(String(describing: self.tapNumberField.text))")
		tap?.tap = tapNumberField.text!
	}
	
	func configureView() {
		tapNumberField.text = tap?.tap
	}
}
