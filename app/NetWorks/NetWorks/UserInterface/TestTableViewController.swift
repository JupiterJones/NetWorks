//
//  TestTableViewController.swift
//  NetWorks
//
//  Created by Jupiter on 4/7/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import SwiftyJSON

class TestTableViewController: UITableViewController {

	var tests: NWTapsAndPortsTest?
	var workOrderLineItem: NWWorkOrderLineItem?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if isMovingFromParentViewController {
			log.verbose("back button pressed")
			// Save any changes
			
		}
	}

	
	
	// MARK: - Actions

	@IBAction func addTap(_ sender: Any) {
		log.verbose("Add new Tap to test")
		addNewTap()
	}
	
	@IBAction func addResult(_ sender: Any) {
		guard let cell = (sender as! UIView).superview?.superview as? TestTapTableViewCell else {
			return // or fatalError() or whatever
		}
		//let indexPath = tableView.indexPath(for: cell)
		//let selected = tapOrPortWithIndexPath(indexPath: indexPath!)
		let port = NWPortResult()
		cell.tap?.ports.append(port)
		tableView.reloadData()
	}
	
	
	// MARK: - New Objects
	
	func addNewTap() {
		let tap = NWTapResult()
		tests?.taps.append(tap)
		tableView.reloadData()
	}
	
	
	// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfTapsAndPorts()
    }

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Taps and Ports Test"
	}
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let selected = tapOrPortWithIndexPath(indexPath: indexPath)
		let selectedType = Mirror.init(reflecting: selected!).subjectType
		var cell = UITableViewCell()
		
		if selectedType == NWTapResult.self {
			let tap = selected as! NWTapResult
			cell = tableView.dequeueReusableCell(withIdentifier: "tapTestCell", for: indexPath)
			(cell as! TestTapTableViewCell).tap = tap
			(cell as! TestTapTableViewCell).configureView()
			
			
		} else if selectedType == NWPortResult.self {
			let port = selected as! NWPortResult
			cell = tableView.dequeueReusableCell(withIdentifier: "portTestCell", for: indexPath)
			
			(cell as! TestResultsTableViewCell).port = port
			(cell as! TestResultsTableViewCell).configureView()
		}
        return cell
    }
	

	
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
	

	
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			
            let deletedIndexes = deleteTapOrPortAtIndexPath(indexPath: indexPath)
            tableView.deleteRows(at: deletedIndexes, with: .fade)
			
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	func numberOfTapsAndPorts() -> Int {
		var result = 0
		let taps = tests?.taps
		for tap in taps! {
			result += 1
			let ports = tap.ports
			for _ in ports {
				result += 1
			}
		}
		return result
	}
	
	func tapOrPortWithIndexPath(indexPath: IndexPath) -> NWTestResult? {
		var result = 0
		let taps = tests?.taps
		for tap in taps! {
			if indexPath.row == result {
				return tap
			}
			result += 1
			let ports = tap.ports
			for port in ports {
				if indexPath.row == result {
					return port
				}
				result += 1
			}
		}
		return nil
	}
	
	func deleteTapOrPortAtIndexPath(indexPath: IndexPath) -> [IndexPath] {
		var result = 0
		let taps = tests?.taps
		for tap in taps! {
			if indexPath.row == result {
				tests?.taps.remove(at: (taps?.index(of: tap))!)
				return indexPaths(section: indexPath.section, startRow: indexPath.row, endRow: indexPath.row + tap.ports.count)
			}
			result += 1
			let ports = tap.ports
			for port in ports {
				if indexPath.row == result {
					tap.ports.remove(at: ports.index(of: port)!)
					return [indexPath]
				}
				result += 1
			}
		}
		// Should never reach here
		log.warning("deleteTapOrPortAtIndexPath() reached an unreachable line somehow")
		return [indexPath]
	}
	
	func indexPaths(section: Int, startRow: Int, endRow: Int) -> [IndexPath] {
		var paths = [IndexPath]()
		for index in startRow...endRow {
			paths.append(IndexPath(row: index, section: section))
		}
		return paths
	}

}
