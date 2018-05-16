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
	
	func apiKey() -> String? {
		let keychain = KeychainSwift(keyPrefix: "NetWorks_")
		let key = UIDevice.current.identifierForVendor!.uuidString
		let apiKey = keychain.getData(key)
		if keychain.lastResultCode != noErr {
			/* Report error */
			log.info("failed to get apiKey for id = \(key)")
			return nil
		} else {
			//log.info("device id key = \(key) value = \(apiKey)", userInfo: Dev.jupiter | Tag.api)
			return String(data: apiKey!, encoding: String.Encoding.utf8)
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
				if let jsonObject = response.result.value, let authorisationResultJSON = jsonObject as? [[String: Any]] {
					XCGLogger.debug("Storing ApiKey \(authorisationResultJSON)")
					//self.apiKey(uuid: jsonObject.something)
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
