//
//  WorkOrderController.swift
//  NetWorks
//
//  Created by Jupiter on 20/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import XCGLogger

class WorkOrderController: UITableViewController {
	
	let workOrderLineItemIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
	let locationIcon = UIImage.fontAwesomeIcon(name: .locationArrow, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
	let assetIcon = UIImage.fontAwesomeIcon(name: .tasks, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
	let pdfIcon = UIImage.fontAwesomeIcon(name: .filePdfO, textColor: UIColor.black, size: CGSize(width: 30, height: 30))


	var workOrder: NWWorkOrder! {
		didSet (newWorkOrder) {
			self.refreshUI()
		}
	}
	
	func refreshUI() {
		// Update the UI for workOrder
		tableView.reloadData()
	}
	
	@IBAction func addLineItem(_ sender: Any) {
		let newLineItem = NWWorkOrderLineItem()
		newLineItem.workOrder = workOrder
		newLineItem.jobLineItem = NWJobLineItem()
		workOrder.lineItems.append(newLineItem)
		refreshUI()
		let indexPath = IndexPath(row: workOrder.lineItems.count, section: 1)
		tableView.selectRow(at: indexPath , animated: true, scrollPosition: UITableViewScrollPosition.none)
		performSegue(withIdentifier: "lineItemSegue", sender: tableView.cellForRow(at: indexPath))
		
	}
	@IBAction func markAsComplete(_ sender: Any) {
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		self.title = workOrder.title
		tableView.delegate = self
		refreshUI()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		refreshUI()
	}

	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension;
	}
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		switch section {
		case 0:
			return "Details"
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
			// Work Order details
			if workOrder.comment == "" {
				return 2
			} else {
				return 3
			}
		case 1:
			// Line Items
			return workOrder.lineItems.count + 1
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
		case 2:
			return actionCell(indexPath: indexPath)
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
			cell.textLabel?.text = "Unknown"
			return cell
		}
    }
	
	
	func detailCell(indexPath: IndexPath) -> UITableViewCell {
		var cellIndex = indexPath.row
		if workOrder.comment == "" {
			 cellIndex = indexPath.row + 1
		} 
		
		switch cellIndex {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
			cell.textLabel?.text = workOrder.comment
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
			let location = workOrder.job?.location
			cell.textLabel?.text = location?.title
			cell.detailTextLabel?.text = location?.comment
			cell.imageView?.image = locationIcon
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "assetCell", for: indexPath)
			cell.textLabel?.text = workOrder.job?.asset
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
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "actionAddLineItem", for: indexPath)
			return cell
		default:
			let lineItem = workOrder.lineItems[indexPath.row - 1]
			let cell = tableView.dequeueReusableCell(withIdentifier: "lineItemCell", for: indexPath)
			cell.textLabel?.text = lineItem.jobLineItem?.lineItemType?.title
			cell.detailTextLabel?.text = lineItem.jobLineItem?.lineItemType?.comment
			cell.imageView?.image = workOrderLineItemIcon
			return cell
		}
	}
	
	func actionCell(indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "actionCompleteCell", for: indexPath)
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
			workOrder.lineItems.remove(at: indexPath.row - 1)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
	

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

	
    // MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
		let selectedIndex = self.tableView.indexPath(for: sender as! UITableViewCell)
		(segue.destination as! WorkOrderLineItemController).lineItem = workOrder.lineItems[selectedIndex!.row - 1]
	}


}
