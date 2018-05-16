//
//  NetWorksAPI.swift
//  NetWorksAPI
//
//  Created by Jupiter on 7/12/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation
import KeychainSwift

public class NWAPI {
	
	public static let shared = NWAPI()
	
	private static let developmentApiHost = "http://dev.api.networks.tai.earth/"
	private static let productionApiHost = "http://api.networks.tai.earth/"
	private static let apiVersion = "2.0"
	
	static let useHost = developmentApiHost
	//static let useHost = productionApiHost
	public static let baseUrl = useHost + apiVersion
	
	let cacheDirectory: URL = {
		let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
		return urls[urls.endIndex - 1]
	}()
	
	private init() { }
	
	// MARK: - Sync Everything
	
	public func sync() {
		// Get the latest job types and line item types for this contractor.
		
	}
	
	// MARK: - Projects API
	public let projectSync = NWProjectSync()
	public func projectsApi() -> NWProjectSync {
		return projectSync
	}
	
	// MARK: - Job Types API
	public let jobTypeSync = NWJobTypeSync()
	public func jobTypesApi() -> NWJobTypeSync {
		return jobTypeSync
	}
	
	// MARK: - Authorisation API
	public let authorisationApi = NWAuthorisationAPI()
	public func authorisation() -> NWAuthorisationAPI {
		return authorisationApi
	}
	


	
	
	// MARK: - Images
	public func imageCacheDirectory() {}
	
}

let api = NWAPI.shared

