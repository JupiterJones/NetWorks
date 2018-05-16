//
//  WorkOrderLineItemViewController.swift
//  NetWorks
//
//  Created by Jupiter on 2/2/18.
//  Copyright © 2018 MyNation. All rights reserved.
//

import UIKit
import XCGLogger

class WorkOrderLineItemViewController: UITableViewController {

	let lineItemTypeIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))

	var lineItem : NWWorkOrderLineItem? {
		didSet {
			// Update the view.
			tests = lineItem?.tests?.allObjects as! [NWTapsAndPortsTest]?
			//files = lineItem?.files?.allObjects as! [NWLineItemFile]?
			configureView()
		}
	}
	
	var tests: [NWTapsAndPortsTest]?
	var files: [NWLineItemFile]?
	var actionsButton: UIBarButtonItem?

	func configureView() {
		// Update the user interface for the detail item.
		self.title = lineItem?.jobLineItem?.lineItemType?.title
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
		let optionsVC = storyboard.instantiateViewController(withIdentifier: "lineItemActions")
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
		return 3
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			// Work Order Line Item details
			return 3
		case 1:
			// Tests
			return (lineItem?.tests?.count)!
		case 2:
			// Images
			//return (lineItem?.files?.count)!
			return 0
		default:
			XCGLogger.error("This should not happen")
			return 0
		}
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		switch section {
		case 0:
			return "Work Order Line Item"
		case 1:
			return "Tests"
		case 2:
			return "Images"
		default:
			XCGLogger.error("This should not happen")
			return ""
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			return detailCell(indexPath: indexPath)
		case 1:
			return testCell(indexPath: indexPath)
		case 2:
			return imageCell(indexPath: indexPath)
		default:
			XCGLogger.error("THIS SHOULD NOT HAVE HAPPENED!!!!!!!!!!!!!! PLEASE CHECK")
			return UITableViewCell()
		}
	}
	
	func detailCell(indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "lineItemTypeCell", for: indexPath)
			cell.textLabel?.text = lineItem?.jobLineItem?.lineItemType?.title
			cell.detailTextLabel?.text = lineItem?.jobLineItem?.lineItemType?.comment
			cell.imageView?.image = lineItemTypeIcon
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "quantityCell", for: indexPath)  as! TextInputTableViewCell
			cell.textField?.text = "\(lineItem?.quantity ?? 0)"
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "quantityCompleteCell", for: indexPath) as! TextInputTableViewCell
			cell.textField?.text = "\(lineItem?.complete ?? 0)"
			return cell
			
		default:
			return UITableViewCell()
		}
	}
	
	func testCell(indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "addTestCell", for: indexPath)
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
			let test = tests?[indexPath.row]
			cell.textLabel?.text = test?.title
			//cell.detailTextLabel?.text = classLabel(object: test)
			return cell
		}
	}
	
	func imageCell(indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "addImageCell", for: indexPath)
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
			let file = files?[indexPath.row]
			cell.textLabel?.text = file?.fileName
			//let imageUrl = URL(string: lineItem.downloadUrl! + "/" + fileName)
			
			// Image Downloader
			//log.verbose("Loading image: " + (imageUrl?.absoluteString)!)
			//let filter = AspectScaledToFitSizeFilter(size: CGSize(width: 64, height: 64))
			//cell.imageView?.af_setImage(withURL: imageUrl!, placeholderImage: placeholderImage, filter: filter, imageTransition: .crossDissolve(0.2))
			
			return cell
		}
	}

	
	// MARK: - Data Changes
	
	@IBAction func valueChanged(_ sender: Any) {
		let changedCell = (sender as! UIView).superview?.superview?.superview as! TextInputTableViewCell
		let changedIndexPath = self.tableView.indexPath(for: changedCell)
		
		XCGLogger.verbose("Updating at indexPath: \(String(describing: changedIndexPath))")
		switch changedIndexPath!.row {
		case 1:
			if let fieldStringValue = changedCell.textField.text {
				if let floatValue = Float(fieldStringValue) {
					lineItem?.quantity = floatValue
				}
			}
		case 2:
			if let fieldStringValue = changedCell.textField.text {
				if let floatValue = Float(fieldStringValue) {
					lineItem?.complete = floatValue
				}
			}
		default:
			return
		}
	}

	

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		if segue.identifier == "lineItemTypeSegue" {
			(segue.destination as! JobLineItemTypesController).jobLineItem = lineItem?.jobLineItem
			(segue.destination as! JobLineItemTypesController).job = lineItem?.workOrder?.job
		}
    }
	

}

extension WorkOrderLineItemViewController : UIPopoverPresentationControllerDelegate {
	func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.none
	}
}
