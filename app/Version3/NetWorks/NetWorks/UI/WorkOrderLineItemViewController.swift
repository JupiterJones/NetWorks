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
			configureView()
		}
	}
	
	var tests: [NWTapsAndPortsTest]?
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WorkOrderLineItemViewController : UIPopoverPresentationControllerDelegate {
	func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.none
	}
}
