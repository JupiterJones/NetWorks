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

public class NWProjectSync : NWSyncBase {
	
	public func projects() -> [NWProject] {
		let request: NSFetchRequest<NWProject> = NWProject.fetchRequest()
		return try! self.dataStack.viewContext.fetch(request)
	}
	
	public func sync(completion: @escaping (_ result: VoidResult) -> ()) {
		syncUsingAlamofire(completion: completion)
	}
	
	func syncUsingAlamofire(completion: @escaping (_ result: VoidResult) -> ()) {
		var headers: HTTPHeaders = [:]
		if let authorizationHeader = Request.authorizationHeader(user: "apiKey", password: "8ac034b7-6f73-475f-b7e0-545853f4338f") {
			headers[authorizationHeader.key] = authorizationHeader.value
		}
		Alamofire.request(NWAPI.baseUrl + "/projects", headers: headers)
			.responseJSON { response in
				debugPrint(response)
				if let jsonObject = response.result.value, let projectsJSON = jsonObject as? [[String: Any]] {
					XCGLogger.debug("Syncing Projects")
					self.dataStack.sync(projectsJSON, inEntityNamed: NWProject.entity().name!) { error in
						completion(.success)
					}
				} else if let error = response.error {
					XCGLogger.error("There has been an error. Running completion with error")
					completion(.failure(error as NSError))
				} else {
					XCGLogger.error("There has been an unknown error")
					fatalError("No error, no failure")
				}
		}
	}
}

public enum VoidResult {
	case success
	case failure(NSError)
}
