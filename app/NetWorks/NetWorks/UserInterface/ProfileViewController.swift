//
//  ProfileViewController.swift
//  NetWorks
//
//  Created by Jupiter on 3/5/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import SwiftyJSON
import XCGLogger
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController {

	@IBOutlet weak var titleView: UILabel!
	@IBOutlet var emailView: UILabel!
	@IBOutlet weak var avitarView: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		// Fetch profile details
		if let _ = (UIApplication.shared.delegate as! AppDelegate).api.apiKey() { getProfile() }
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	func getProfile() {
		NWGetProfileService().executeTask() {
			if let value = $0.result.value {
				let jsonModel = JSON(value)
				if let title = jsonModel["contractor"]["title"].string {
					self.titleView.text = title
				}
				if let email = jsonModel["contractor"]["email"].string {
					log.verbose("ProfileViewController - setting title", userInfo: Dev.jupiter | Tag.api)
					self.emailView.text = email
				}
				if let avatarUrl = jsonModel["contractor"]["avatarUrl"].string {
					log.verbose("ProfileViewController - setting avatar", userInfo: Dev.jupiter | Tag.api)
					self.avitarView.af_setImage(withURL: URL(string: avatarUrl)!)
					//self.getAvatarImage(url: avatarUrl)
				}
			}
		}
	}
	
	func getAvatarImage(url: String) {
		log.verbose("ProfileViewController - getAvatarImage() loading image", userInfo: Dev.jupiter | Tag.api)
		Alamofire.request(url).responseImage { response in debugPrint(response)
			log.verbose("ProfileViewController - getAvatarImage() image loaded", userInfo: Dev.jupiter | Tag.api)
			print(response.request!)
			print(response.response!)
			debugPrint(response.result)
	
			if let image = response.result.value {
				print("image downloaded: \(image)")
				
			}
		}
	}

}
