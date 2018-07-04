//
//  JobLineItemTypeSearchResultsController.swift
//  NetWorks
//
//  Created by Jupiter on 26/6/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit

class JobLineItemTypeSearchResultsController: BaseJobLineItemTypesController {

	// MARK: - Properties

	var filteredJobLineItemTypes = [NWJobLineItemType]()

	
	
	// MARK: - UITableViewDataSource
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredJobLineItemTypes.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: BaseJobLineItemTypesController.tableViewCellIdentifier, for: indexPath)
		
		let lineItemType = filteredJobLineItemTypes[indexPath.row]
		configureCell(cell, forLineItemType: lineItemType)
		
		return cell
	}

}
