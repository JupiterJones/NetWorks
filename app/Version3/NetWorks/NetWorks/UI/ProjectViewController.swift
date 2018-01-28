//
//  ProjectViewControlller.swift
//  NetWorks
//
//  Created by Jupiter on 7/12/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import CoreData

class ProjectViewController: UIViewController {
	
	@IBOutlet weak var detailCommentLabel: UILabel!

	var detailItem: NWProject? {
		didSet {
			// Update the view.
			configureView()
		}
	}

	func configureView() {
		// Update the user interface for the detail item.
		if let detail = detailItem {
		    if let label = detailCommentLabel {
		        label.text = detail.comment
		    }
		}
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


}

