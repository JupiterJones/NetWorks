//
//  AuthorisationViewController.swift
//  NetWorks
//
//  Created by Jupiter on 25/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import XCGLogger
import Alamofire
import Restofire
import SwiftyJSON


class AuthorisationViewController: UIViewController {

	@IBOutlet weak var authorisationCodeField: UITextField!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func authorisationCodeChanged(_ sender: Any) {
		let text = authorisationCodeField.text!
		if (text.utf8.count == 4) {
			log.verbose("apiKey requested for code : \(text))", userInfo: Dev.jupiter | Tag.api)
			activityIndicator.startAnimating()
			getApiKey(authorisationCode: text)
		} else {
			activityIndicator.stopAnimating()
		}
	}
	
	func getApiKey(authorisationCode: String) {
		NWGetAuthorisationService(authCode: authorisationCode).executeTask() {
			if let value = $0.result.value {
				let jsonModel = JSON(value)
				if let uuidString = jsonModel["apiKey"].string {
					let apiKey = UUID(uuidString: uuidString)
					log.verbose("API-KEY = \(String(describing: apiKey))", userInfo: Dev.jupiter | Tag.api)
					
					// Setup the keychain
					self.api().apiKey(uuid: apiKey!)
					
					self.navigationController?.popViewController(animated: true)
					log.verbose("Popped View Controller", userInfo: Dev.jupiter | Tag.api)
				} else {
					self.activityIndicator.stopAnimating()
					self.showNoApiKeyMessage()
				}
			}
		}
	}
	
	func showNoApiKeyMessage() {
		let alertController = UIAlertController(title: NSLocalizedString("Not Found",comment:""), message: NSLocalizedString("Check the NetWorks website for your authorisation code.",comment:""), preferredStyle: .alert)
		let defaultAction = UIAlertAction(title:     NSLocalizedString("Ok", comment: ""), style: .default, handler: { (pAlert) in
			//Do whatever you wants here
		})
		alertController.addAction(defaultAction)
		self.present(alertController, animated: true, completion: nil)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	func api() -> NetWorksAPI {
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		return appDelegate.api
	}

}
