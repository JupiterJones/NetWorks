//
//  TestResultsTableViewCell.swift
//  NetWorks
//
//  Created by Jupiter on 4/7/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit

class TestResultsTableViewCell: UITableViewCell {

	static let portIcon = UIImage.fontAwesomeIcon(name: .plug, textColor: UIColor.black, size: CGSize(width: 25, height: 25))
	static let unitIcon = UIImage.fontAwesomeIcon(name: .home, textColor: UIColor.black, size: CGSize(width: 25, height: 25))
	static let highLowIcon = UIImage.fontAwesomeIcon(name: .arrowsV, textColor: UIColor.black, size: CGSize(width: 25, height: 25))
	
	var port : NWPortResult?
	
	@IBOutlet weak var portIconView: UIImageView!
	@IBOutlet weak var portTextField: UITextField!
	@IBOutlet weak var unitIconView: UIImageView!
	@IBOutlet weak var unitTextField: UITextField!
	@IBOutlet weak var highLowIconView: UIImageView!
	@IBOutlet weak var highValueTextField: UITextField!
	@IBOutlet weak var lowValueTextField: UITextField!
	
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		portIconView.image = TestResultsTableViewCell.portIcon
		unitIconView.image = TestResultsTableViewCell.unitIcon
		highLowIconView.image = TestResultsTableViewCell.highLowIcon
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configureView() {
		portTextField.text = port?.port
		unitTextField.text = port?.unit
		lowValueTextField.text = "\(port?.low ?? 0)"
		highValueTextField.text = "\(port?.high ?? 0)"
	}

	@IBAction func valueUpdated(_ sender: Any) {
		port?.port = portTextField.text!
		port?.unit = unitTextField.text!
		if let lowValue = Float(lowValueTextField.text!) { port?.low = lowValue }
		if let highValue = Float(highValueTextField.text!) { port?.high =  highValue }
	}
}
