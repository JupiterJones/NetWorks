//
//  WorkOrderLineItemActionsViewController.swift
//  NetWorks
//
//  Created by Jupiter on 2/2/18.
//  Copyright © 2018 MyNation. All rights reserved.
//

import UIKit

class WorkOrderLineItemActionsViewController: UIViewController {
	
	@IBOutlet weak var takePhotoButton: UIButton!
	@IBOutlet weak var addTestButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func takePhoto(_ sender: Any) {
		self.dismiss(animated: true, completion: {})
	}
	
	@IBAction func addTest(_ sender: Any) {
		self.dismiss(animated: true, completion: {})
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
