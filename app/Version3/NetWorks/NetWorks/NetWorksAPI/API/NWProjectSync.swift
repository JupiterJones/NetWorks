
//
//  NWProjectSync.swift
//  NetWorksAPI
//
//  Created by Jupiter on 7/12/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation
import CoreData
import Sync
import Alamofire
import XCGLogger
import PKHUD

public class NWProjectSync : NWSyncBase {
	
	public func projects() -> [NWProject] {
		let request: NSFetchRequest<NWProject> = NWProject.fetchRequest()
		return try! self.dataStack.viewContext.fetch(request)
	}
	
	public func sync(completion: @escaping (_ result: VoidResult) -> ()) {
		syncUsingAlamofire(completion: completion)
	}
	
	func syncUsingAlamofire(completion: @escaping (_ result: VoidResult) -> ()) {
		PKHUD.sharedHUD.contentView = PKHUDProgressView(title: "Syncing", subtitle: "Fetching Projects")
		PKHUD.sharedHUD.show()
		
		var headers: HTTPHeaders = [:]
		if let userApiKey = apiKey() {
			if let authorizationHeader = Request.authorizationHeader(user: "apiKey", password: userApiKey) {
				headers[authorizationHeader.key] = authorizationHeader.value
			}
		}

		Alamofire.request(NWAPI.baseUrl + "/projects", headers: headers)
			.responseJSON { response in
				debugPrint(response)
				if let jsonObject = response.result.value, let projectsJSON = jsonObject as? [[String: Any]] {
					XCGLogger.debug("Syncing Projects")
					self.dataStack.sync(projectsJSON, inEntityNamed: NWProject.entity().name!) { error in
						HUD.flash(.success)
						completion(.success)
					}
				} else if let error = response.error {
					XCGLogger.error("There has been an error. Running completion with error")
					HUD.flash(.error)
					completion(.failure(error as NSError))
				} else {
					XCGLogger.error("There has been an unknown error")
					HUD.flash(.error)
					fatalError("No error, no failure")
				}
		}
	}
	
	func pushProjectChanges(project : NWProject) {
		var request = URLRequest(url: URL(string:  NWAPI.baseUrl + "/project")!)
		request.httpMethod = HTTPMethod.post.rawValue
		request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
		
		if let userApiKey = apiKey() {
			if let authorizationHeader = Request.authorizationHeader(user: "apiKey", password: userApiKey) {
				request.setValue(authorizationHeader.value, forHTTPHeaderField: authorizationHeader.key)
			}
		}
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
		
		var exportOptions = ExportOptions()
		exportOptions.inflectionType = .camelCase
		exportOptions.relationshipType = .array
		exportOptions.dateFormatter = dateFormatter
		let export = project.export(using: exportOptions)
		var jsonData = Data()
		
		do {
			//let jsonWritingOptions = JSONSerialization.WritingOptions.prettyPrinted
			jsonData = try JSONSerialization.data(withJSONObject: export)
		} catch {
			log.error("Error while converting json to utf8 string: \(error)")
		}
		request.httpBody = jsonData
		log.verbose("jsonData: \(jsonData)")
		
		Alamofire.request(request)
			.responseJSON { response in
				debugPrint(response)
		}
	}
}

public enum VoidResult {
	case success
	case failure(NSError)
}
