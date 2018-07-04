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
			activityIndicator.startAnimating()
			getApiKey(authorisationCode: text)
		} else {
			activityIndicator.stopAnimating()
		}
	}
	
	func getApiKey(authorisationCode: String) {
		api.authorisation().fetchApiKeyForAuthorisationCode(authCode: authorisationCode) { result in
			switch result {
			case .success:
				log.verbose("got api key")
				self.dismiss(animated: true, completion: {} )
				//self.navigationController?.popViewController(animated: true)
				log.verbose("Popped View Controller")
			case .failure(let error):
				log.verbose("no api key found")
				self.activityIndicator.stopAnimating()
				self.showNoApiKeyMessage()
				print(error)
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
	

}
