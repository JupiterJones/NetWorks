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
import Networking
import Alamofire

public class NWProjectSync {
	
	private let dataStack: DataStack
	private lazy var networking: Networking = {
		Networking(baseURL: NWAPI.baseUrl)
	}()
	
	
	init() {
		self.dataStack = DataStack(modelName: "NetWorksDataModel")
	}
	
	public func projects() -> [NWProject] {
		let request: NSFetchRequest<NWProject> = NWProject.fetchRequest()
		return try! self.dataStack.viewContext.fetch(request)
	}
	
	public func sync(completion: @escaping (_ result: VoidResult) -> ()) {
		syncUsingAlamofire(completion: completion)
	}
	
	func syncUsingNetworking(completion: @escaping (_ result: VoidResult) -> ()) {
		self.networking.get("/Projects") { result in
			switch result {
			case .success(let response):
				let projectsJSON = response.arrayBody
				self.dataStack.sync(projectsJSON, inEntityNamed: NWProject.entity().name!) { error in
					completion(.success)
				}
			case .failure(let response):
				completion(.failure(response.error))
			}
		}
	}
	
	func syncUsingAlamofire(completion: @escaping (_ result: VoidResult) -> ()) {
		var headers: HTTPHeaders = [:]
		if let authorizationHeader = Request.authorizationHeader(user: "apiKey", password: "8ac034b7-6f73-475f-b7e0-545853f4338f") {
			headers[authorizationHeader.key] = authorizationHeader.value
		}
		
		Alamofire.request(NWAPI.baseUrl + "/projects", headers: headers)
			.responseJSON { response in
				debugPrint(response.request as Any)
				debugPrint(response)
				if let jsonObject = response.result.value, let projectsJSON = jsonObject as? [[String: Any]] {
					self.dataStack.sync(projectsJSON, inEntityNamed: NWProject.entity().name!) { error in
						completion(.success)
					}
				} else if let error = response.error {
					completion(.failure(error as NSError))
				} else {
					fatalError("No error, no failure")
				}
		}
	}
}

public enum VoidResult {
	case success
	case failure(NSError)
}
