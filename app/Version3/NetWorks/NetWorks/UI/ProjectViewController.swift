//
//  ProjectViewControlller.swift
//  NetWorks
//
//  Created by Jupiter on 7/12/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import CoreData

class ProjectViewController: UITableViewController {
	
	let projectIcon = UIImage.fontAwesomeIcon(name: .briefcase, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))
	let clientIcon = UIImage.fontAwesomeIcon(name: .buildingO, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))
	let workOrderIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))

	var project: NWProject? {
		didSet {
			// Update the view.
			workOrders = (project?.workOrders?.allObjects as! [NWWorkOrder]).sorted( by: { $0.title! < $1.title! } )
			configureView()
		}
	}
	
	var workOrders: [NWWorkOrder]?

	func configureView() {
		// Update the user interface for the detail item.
		self.title = project?.title
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		if project != nil {
			return 2
		} else {
			return 0
		}
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Project"
		default:
			return "Work Orders"
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		switch section {
		case 0:
			return 2
		default:
			if let count = project?.workOrders?.count {
				return count
			} else {
				return 0
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)
			switch indexPath.row {
			case 0:
				cell.textLabel?.text = project?.title
				cell.detailTextLabel?.text = project?.comment
				cell.imageView?.image = projectIcon
			case 1:
				cell.textLabel?.text = project?.client?.title
				cell.detailTextLabel?.text = project?.client?.comment
				cell.imageView?.image = clientIcon
			default:
				cell.textLabel?.text = "Error"
			}
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "workOrderCell", for: indexPath)
			cell.textLabel?.text = workOrders?[indexPath.row].title
			cell.detailTextLabel?.text = workOrders?[indexPath.row].comment
			cell.imageView?.image = workOrderIcon
			return cell
		}
	}
	
	// MARK: - Segues
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showWorkOrder" {
			if let indexPath = tableView.indexPathForSelectedRow {
				let workOrder = workOrders?[indexPath.row]
				let controller = segue.destination as! WorkOrderViewController
				controller.workOrder = workOrder
				controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
				controller.navigationItem.leftItemsSupplementBackButton = true
			}
		}
	}

}

