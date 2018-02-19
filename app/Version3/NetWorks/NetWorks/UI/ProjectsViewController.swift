//
//  ProjectsViewController.swift
//  NetWorks
//
//  Created by Jupiter on 7/12/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import CoreData
import FontAwesome

class ProjectsViewController: UITableViewController {
	
	let projectIcon = UIImage.fontAwesomeIcon(name: .briefcase, textColor: UIColor.gray, size: CGSize(width: 32, height: 32))

	var projectViewController: ProjectViewController? = nil
	var projects = [NWProject]()
	let api = NWAPI.shared.projectsApi()
		
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		navigationItem.leftBarButtonItem = editButtonItem

		//let actionsButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
		//navigationItem.rightBarButtonItem = addButton
		
		if let split = splitViewController {
		    let controllers = split.viewControllers
			self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
		    projectViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? ProjectViewController
		}
		
		
		self.projects = api.projects()
		self.refresh(sender: self)
	}
	
	@objc
	func refresh(sender: Any) {
		api.sync() { result in
			switch result {
			case .success:
				self.projects = self.api.projects()
				self.tableView.reloadData()
			case .failure(let error):
				print(error)
			}
			self.refreshControl?.endRefreshing()
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@objc
	func insertNewObject(_ sender: Any) {
		projects.insert(NWProject(), at: 0)
		let indexPath = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [indexPath], with: .automatic)
	}

	// MARK: - Segues

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showProject" {
		    if let indexPath = tableView.indexPathForSelectedRow {
		        let object = projects[indexPath.row]
				let controller = (segue.destination as! UINavigationController).topViewController as! ProjectViewController
		        controller.project = object
		        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}

	// MARK: - Table View

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return projects.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)

		let project = projects[indexPath.row]
		cell.textLabel!.text = project.title!
		cell.detailTextLabel!.text = project.comment
		cell.imageView?.image = projectIcon
		return cell
	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
		    projects.remove(at: indexPath.row)
		    tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
		    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
		}
	}


}

