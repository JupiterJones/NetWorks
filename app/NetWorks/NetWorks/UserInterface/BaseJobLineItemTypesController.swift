//
//  BaseJobLineItemTypesController.swift
//  NetWorks
//
//  Created by Jupiter on 26/6/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit

class BaseJobLineItemTypesController: UITableViewController {
	
	// MARK: - Properties
	
	static let nibName = "JobLineItemTypeCell"
	static let tableViewCellIdentifier = "lineItemTypeCell"
	
	let jobLineItemTypeIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.black, size: CGSize(width: 30, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let nib = UINib(nibName: BaseJobLineItemTypesController.nibName, bundle: nil)
		
		// Required if our subclasses are to use `dequeueReusableCellWithIdentifier(_:forIndexPath:)`.
		tableView.register(nib, forCellReuseIdentifier: BaseJobLineItemTypesController.tableViewCellIdentifier)

	}
	
	// MARK: - Table view data source
	
	
	// MARK: - Configure Cell
	
	func configureCell(_ cell: UITableViewCell, forLineItemType lineItemType: NWJobLineItemType) {
		cell.textLabel?.text = lineItemType.title
		cell.detailTextLabel?.text = lineItemType.comment
		cell.imageView?.image = jobLineItemTypeIcon
	}

}
