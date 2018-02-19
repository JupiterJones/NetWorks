//
//  WorkOrderViewController.swift
//  NetWorks
//
//  Created by Jupiter on 1/2/18.
//  Copyright © 2018 MyNation. All rights reserved.
//

import UIKit
import CoreData
import XCGLogger

class WorkOrderViewController: UITableViewController {
	
	let workOrderIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))
	let workOrderLineItemIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.gray, size: CGSize(width: 33, height: 33))
	let locationIcon = UIImage.fontAwesomeIcon(name: .locationArrow, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))
	let assetIcon = UIImage.fontAwesomeIcon(name: .tasks, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))
	let pdfIcon = UIImage.fontAwesomeIcon(name: .filePdfO, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))

	var workOrder : NWWorkOrder? {
		didSet {
			// Update the view.
			workOrderLineItems = workOrder?.lineItems?.allObjects as! [NWWorkOrderLineItem]?
			configureView()
		}
	}
	
	var workOrderLineItems: [NWWorkOrderLineItem]?
	var actionsButton: UIBarButtonItem?
	
	func configureView() {
		// Update the user interface for the detail item.
		self.title = workOrder?.title
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		let button = UIButton.init(type: .custom)
		let actionIcon = UIImage.fontAwesomeIcon(name: .cog, textColor: button.tintColor, size: CGSize(width: 32, height: 32))
		button.setImage(actionIcon, for: .normal)
		button.addTarget(self, action: #selector(displayActionsMenu(_:)), for: .touchUpInside)
		actionsButton = UIBarButtonItem(customView: button)
		navigationItem.rightBarButtonItem = actionsButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func displayActionsMenu(_ sender: Any) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let optionsVC = storyboard.instantiateViewController(withIdentifier: "workOrderActions")
		optionsVC.modalPresentationStyle = .popover
		optionsVC.preferredContentSize = CGSize(width: 200, height: 90)
		
		let popOverController = optionsVC.popoverPresentationController
		popOverController!.delegate = self
		popOverController!.barButtonItem = actionsButton
		popOverController?.permittedArrowDirections = .any
		
		self.present(optionsVC, animated: true) {
			// The popover is visible.
		}
	}
	

	
	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 2
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		switch section {
		case 0:
			return "Work Order"
		case 1:
			return "Line Items"
		case 2:
			return "Actions"
		default:
			return "Unknown"
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		switch section {
		case 0:
			return 3
		case 1:
			// Line Items
			return (workOrderLineItems?.count)!
		case 2:
			// Actions
			return 1
		default:
			return 0
		}
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			return detailCell(indexPath: indexPath)
		case 1:
			return lineItemCell(indexPath: indexPath)
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "workOrderCell", for: indexPath)
			cell.textLabel?.text = "Error"
			return cell
		}
	}
	
	
	func detailCell(indexPath: IndexPath) -> UITableViewCell {

		
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "workOrderCell", for: indexPath)
			cell.textLabel?.text = workOrder?.title
			cell.detailTextLabel?.text = workOrder?.comment
			cell.imageView?.image = workOrderIcon
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
			let location = workOrder?.job?.location
			cell.textLabel?.text = location?.title
			cell.detailTextLabel?.text = location?.comment
			cell.imageView?.image = locationIcon
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "assetCell", for: indexPath)
			cell.textLabel?.text = workOrder?.job?.asset
			cell.imageView?.image = assetIcon
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "preStartDocumentCell", for: indexPath)
			cell.textLabel?.text = "Pre-Start Document"
			cell.imageView?.image = pdfIcon
			cell.detailTextLabel?.text = "Document Date"
			return cell
		}
	}
	
	func lineItemCell(indexPath: IndexPath) -> UITableViewCell {
		let lineItem = workOrderLineItems?[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "lineItemCell", for: indexPath)
		cell.textLabel?.text = lineItem?.jobLineItem?.lineItemType?.title
		cell.detailTextLabel?.text = lineItem?.jobLineItem?.lineItemType?.comment
		cell.imageView?.image = workOrderLineItemIcon
		return cell
	}

	// Override to support conditional editing of the table view.
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return indexPath.section == 1
	}
	
	// Override to support editing the table view.
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			//workOrderLineItems.remove(at: indexPath.row - 1)
			// Delete the row from the data source
			//tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showLineItem" {
			let selectedIndex = self.tableView.indexPath(for: sender as! UITableViewCell)
			(segue.destination as! WorkOrderLineItemViewController).lineItem = workOrderLineItems?[selectedIndex!.row]
		}
	}
}

extension WorkOrderViewController : UIPopoverPresentationControllerDelegate {
	func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.none
	}
}
