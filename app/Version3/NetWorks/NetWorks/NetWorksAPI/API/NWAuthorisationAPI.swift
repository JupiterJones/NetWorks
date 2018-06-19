//
//  NWAuthorisationAPI.swift
//  NetWorks
//
//  Created by Jupiter on 22/4/18.
//  Copyright © 2018 MyNation. All rights reserved.
//

import Foundation
import CoreData
import Alamofire
import XCGLogger
import KeychainSwift



public class NWAuthorisationAPI : NWSyncBase {
	
	// MARK: - Authorisation Key
	func apiKeyTest() -> String {
		return "31de4f60-d5ea-4fc9-8fe0-d25de4d41907"
	}
	
	override func apiKey() -> String? {
		let keychain = KeychainSwift(keyPrefix: "NetWorks_")
		let key = UIDevice.current.identifierForVendor!.uuidString
		let apiKey = keychain.getData(key)
		if keychain.lastResultCode != noErr {
			/* Report error */
			log.info("failed to get apiKey for id = \(key)")
			
			// NOTE: Hard code an apiKey for testing. MUST BE REMOVED
			//return apiKeyTest()
			return nil
		} else {
			//log.info("device id key = \(key) value = \(apiKey)", userInfo: Dev.jupiter | Tag.api)
			return String(data: apiKey!, encoding: String.Encoding.utf8)!
		}
	}
	
	func apiKey(uuid: UUID) {
		log.info("setting apiKey for uuid = \(uuid)")
		let keychain = KeychainSwift(keyPrefix: "NetWorks_")
		let key = UIDevice.current.identifierForVendor!.uuidString
		keychain.set(uuid.uuidString, forKey: key)
	}

	
	func fetchApiKeyForAuthorisationCode(authCode: String, completion: @escaping (_ result: VoidResult) -> ()) {
		fetchUsingAlamofire(authCode: authCode, completion: completion)
	}
	
	func fetchUsingAlamofire(authCode: String, completion: @escaping (_ result: VoidResult) -> ()) {
		var headers: HTTPHeaders = [:]
		if let authorizationHeader = Request.authorizationHeader(user: "authCode", password: authCode) {
			headers[authorizationHeader.key] = authorizationHeader.value
		}
		Alamofire.request(NWAPI.baseUrl + "/verifyAuthorisationCode", headers: headers)
			.responseJSON { response in
				debugPrint(response)
				if let jsonObject = response.result.value, let authorisationResultJSON = jsonObject as? [String: Any] {
					if let uuidString = authorisationResultJSON["apiKey"] as! String? {
						let apiKey = UUID(uuidString: uuidString)
						log.verbose("API-KEY = \(String(describing: apiKey))")
						
						// Setup the keychain
						api.authorisation().apiKey(uuid: apiKey!)
					} else { completion(.failure(NSError(domain: <#T##String#>, code: <#T##Int#>, userInfo: <#T##[String : Any]?#>) ) }
					
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
