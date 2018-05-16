//
//  NWJobTypeSync.swift
//  NetWorks
//
//  Created by Jupiter on 7/3/18.
//  Copyright © 2018 MyNation. All rights reserved.
//

import Foundation
import CoreData
import Sync
import Alamofire
import XCGLogger
import PKHUD
import Hydra

public class NWJobTypeSync : NWSyncBase {
	
	public func jobTypes() -> [NWJobType] {
		let request: NSFetchRequest<NWJobType> = NWJobType.fetchRequest()
		return try! self.dataStack.viewContext.fetch(request)
	}
	
	public func serverJobTypes() -> Promise<[NWJobType]> {
		return Promise<[NWJobType]>(in: .background, { resolve, reject, _ in
			let request: NSFetchRequest<NWJobType> = NWJobType.fetchRequest()
			do {
				let result = try self.dataStack.viewContext.fetch(request)
				resolve(result)
			} catch {
				reject(error)
			}
		})
	}
	
	func sync(completion: @escaping (_ result: VoidResult) -> ()) {
		syncUsingAlamofire(completion: completion)
	}
	
	func syncUsingAlamofire(completion: @escaping (_ result: VoidResult) -> ()) {
		var headers: HTTPHeaders = [:]
		if let authorizationHeader = Request.authorizationHeader(user: "apiKey", password: apiKey()) {
			headers[authorizationHeader.key] = authorizationHeader.value
		}
		Alamofire.request(NWAPI.baseUrl + "/jobTypes", headers: headers)
			.responseJSON { response in
				debugPrint(response)
				if let jsonObject = response.result.value, let jobTypesJSON = jsonObject as? [[String: Any]] {
					XCGLogger.debug("Syncing Job Types")
					self.dataStack.sync(jobTypesJSON, inEntityNamed: NWJobType.entity().name!) { error in
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
