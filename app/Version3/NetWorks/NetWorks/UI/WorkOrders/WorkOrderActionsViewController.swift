//
//  WorkOrderActionsViewController.swift
//  NetWorks
//
//  Created by Jupiter on 1/2/18.
//  Copyright © 2018 MyNation. All rights reserved.
//

import UIKit

class WorkOrderActionsViewController: UIViewController {

	@IBOutlet weak var addLineItemButton: UIButton!
	@IBOutlet weak var markAsCompleteButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func addLineItem(_ sender: Any) {
		self.dismiss(animated: true, completion: {})
	}
	
	@IBAction func markAsComplete(_ sender: Any) {
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
