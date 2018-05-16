//
//  JobLineItemTypesController.swift
//  NetWorks
//
//  Created by Jupiter on 25/6/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit

class JobLineItemTypesController: BaseJobLineItemTypesController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
	
	// MARK: - Types
	
	/// State restoration values.
	enum RestorationKeys : String {
		case viewControllerTitle
		case searchControllerIsActive
		case searchBarText
		case searchBarIsFirstResponder
	}
 
	struct SearchControllerRestorableState {
		var wasActive = false
		var wasFirstResponder = false
	}
	
	
	// MARK: - Properties
	var jobLineItem: NWJobLineItem?
	var job: NWJob?
	var jobLineItemTypes = [NWJobLineItemType]()
	
	/// Search controller to help us with filtering.
	var searchController: UISearchController!
	
	/// Secondary search results table view.
	var resultsTableController: JobLineItemTypeSearchResultsController!
	
	/// Restoration state for UISearchController
	var restoredState = SearchControllerRestorableState()

	
	
	// MARK: - View Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		resultsTableController = JobLineItemTypeSearchResultsController()
		
		// We want ourselves to be the delegate for this filtered table so didSelectRowAtIndexPath(_:) is called for both tables.
		resultsTableController.tableView.delegate = self
		
		searchController = UISearchController(searchResultsController: resultsTableController)
		searchController.searchResultsUpdater = self
		searchController.searchBar.sizeToFit()
		tableView.tableHeaderView = searchController.searchBar
		
		searchController.delegate = self
		searchController.dimsBackgroundDuringPresentation = false // default is YES
		searchController.searchBar.delegate = self    // so we can monitor text changes + others
		
		/*
		Search is now just presenting a view controller. As such, normal view controller
		presentation semantics apply. Namely that presentation will walk up the view controller
		hierarchy until it finds the root view controller or one that defines a presentation context.
		*/
		definesPresentationContext = true
		
		// Fetch the initial set of JobLineItemTypes
		refreshTypes(sender: self)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		// Restore the searchController's active state.
		if restoredState.wasActive {
			searchController.isActive = restoredState.wasActive
			restoredState.wasActive = false
			
			if restoredState.wasFirstResponder {
				searchController.searchBar.becomeFirstResponder()
				restoredState.wasFirstResponder = false
			}
		}
	}
	
	
	// MARK: - UISearchBarDelegate
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
	}
	
	
	// MARK: - UISearchControllerDelegate
	
	func presentSearchController(_ searchController: UISearchController) {
		log.verbose("UISearchControllerDelegate invoked method: \(#function).")
	}
	
	func willPresentSearchController(_ searchController: UISearchController) {
		log.verbose("UISearchControllerDelegate invoked method: \(#function).")
	}
	
	func didPresentSearchController(_ searchController: UISearchController) {
		log.verbose("UISearchControllerDelegate invoked method: \(#function).")
	}
	
	func willDismissSearchController(_ searchController: UISearchController) {
		log.verbose("UISearchControllerDelegate invoked method: \(#function).")
	}
	
	func didDismissSearchController(_ searchController: UISearchController) {
		log.verbose("UISearchControllerDelegate invoked method: \(#function).")
	}
	

	// MARK: - UISearchResultsUpdating
	
	func updateSearchResults(for searchController: UISearchController) {
		
		// Update the filtered array based on the search text.
		let searchResults = jobLineItemTypes
		
		// Strip out all the leading and trailing spaces.
		let whitespaceCharacterSet = CharacterSet.whitespaces
		let strippedString = searchController.searchBar.text!.trimmingCharacters(in: whitespaceCharacterSet)
		let searchItems = strippedString.components(separatedBy: " ") as [String]
		
		// Build all the "OR" expressions for each value in the searchString.
		let orMatchPredicates: [NSPredicate] = searchItems.map { searchString in
			// Each searchString creates an OR predicate for the jobLineItemType title and comment
			//
			// Example if searchItems contains "02-01 cabinet large":
			//      title CONTAINS[c] "02-01" OR
			//      title CONTAINS[c] "cabinet" OR
			//      title CONTAINS[c] "large" OR
			//      comment CONTAINS[c] "02-01" OR
			//      comment CONTAINS[c] "cabinet" OR
			//      comment CONTAINS[c] "large" OR
			//
			var searchItemsPredicate = [NSPredicate]()
			
			// Below we use NSExpression represent expressions in our predicates.
			// NSPredicate is made up of smaller, atomic parts: two NSExpressions (a left-hand value and a right-hand value).
			
			let searchStringExpression = NSExpression(forConstantValue: searchString)
			
			// Title field matching.
			let titleExpression = NSExpression(forKeyPath: "title")
			let titleSearchComparisonPredicate = NSComparisonPredicate(leftExpression: titleExpression, rightExpression: searchStringExpression, modifier: .direct, type: .contains, options: .caseInsensitive)
			
			searchItemsPredicate.append(titleSearchComparisonPredicate)
		
			// Comment field matching.
			let commentExpression = NSExpression(forKeyPath: "comment")
			let commentSearchComparisonPredicate = NSComparisonPredicate(leftExpression: commentExpression, rightExpression: searchStringExpression, modifier: .direct, type: .contains, options: .caseInsensitive)
			
			searchItemsPredicate.append(commentSearchComparisonPredicate)
			
			let compoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: searchItemsPredicate)
			return compoundPredicate
		}
		
		
		// Match up the fields of the JobLineItemType object.
		
		let finalCompoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: orMatchPredicates)
		let filteredResults = searchResults.filter { finalCompoundPredicate.evaluate(with: $0) }
		
		// Hand over the filtered results to our search results table.
		let resultsController = searchController.searchResultsController as! JobLineItemTypeSearchResultsController
		resultsController.filteredJobLineItemTypes = filteredResults
		resultsController.tableView.reloadData()
	}


	
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jobLineItemTypes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BaseJobLineItemTypesController.tableViewCellIdentifier, for: indexPath)
		let lineItemType = jobLineItemTypes[indexPath.row]
        configureCell(cell, forLineItemType: lineItemType)
        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let lineItemType = jobLineItemTypes[indexPath.row]
		log.verbose("LineItemType selected: \(String(describing: lineItemType.title))")
		jobLineItem?.lineItemType = lineItemType
		navigationController?.popViewController(animated: true)
		
	}


	
	// MARK: - API Access
	
	func refreshTypes(sender: Any) {
		api.jobTypesApi().sync() { result in
			switch result {
			case .success:
				self.jobLineItemTypes = self.jobLineItem?.lineItemType?.jobType?.lineItemTypes?.allObjects as! [NWJobLineItemType]
				self.tableView.reloadData()
			case .failure(let error):
				print(error)
			}
			self.refreshControl?.endRefreshing()
		}
	}


}
