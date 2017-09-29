//
//  WorkOrdersController.swift
//  NetWorks
//
//  Created by Jupiter on 20/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import SwiftyJSON
import XCGLogger
import FontAwesome


class WorkOrdersController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
	
	let workOrderIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
	
	@IBOutlet weak var searchController: UISearchBar!

	var workOrders: [NWWorkOrder] = [] {
		didSet (newWorkOrders) {
			self.refreshUI()
		}
	}
	
	var workOrdersSearchResults: [NWWorkOrder]?
	
	func refreshUI() {
		// Update the UI for workOrder
		log.verbose("WorkOrdersController-refreshUI()", userInfo: Dev.jupiter | Tag.api)
		self.tableView.reloadData()
	}

	
	@IBAction func refresh(_ sender: Any) {
		getWorkOrders()
	}
	
	func filterContentForSearchText(searchText: String) {
		// Filter the array using the filter method
		if self.workOrders.isEmpty {
			self.workOrdersSearchResults = nil
			return
		}
		self.workOrdersSearchResults = self.workOrders.filter({( workOrder: NWWorkOrder) -> Bool in
			// to start, let's just search by name
			return workOrder.title!.lowercased().contains(searchText.lowercased())
		})
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		getWorkOrders()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		refreshUI()
	}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		switch section {
		case 0:
			return self.workOrders.count
		default:
			return 0
		}
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workOrderCell", for: indexPath)

        // Configure the cell...
		cell.textLabel?.text = workOrders[indexPath.row].title
		cell.detailTextLabel?.text = workOrders[indexPath.row].comment
		cell.imageView?.image = workOrderIcon

        return cell
    }
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
		(segue.destination as! WorkOrderController).workOrder = workOrders[selectedIndex!.row]
    }
	
	// MARK: - API Access
	func getWorkOrders() {
		NWGetWorkOrdersService().executeTask() {
			guard let model = $0.result.value else { return }
			let response = JSON(model)
			let api = (UIApplication.shared.delegate as! AppDelegate).api
			api.updateWorkOrders(from: response)
			self.workOrders = api.workOrders
			
		}
	}
}

