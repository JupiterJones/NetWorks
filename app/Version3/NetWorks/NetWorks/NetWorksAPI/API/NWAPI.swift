//
//  NetWorksAPI.swift
//  NetWorksAPI
//
//  Created by Jupiter on 7/12/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation

public class NWAPI {
	
	public static let shared = NWAPI()
	
	private static let developmentApiHost = "http://dev.api.networks.tai.earth/"
	private static let productionApiHost = "http://api.networks.tai.earth/"
	private static let apiVersion = "2.0"
	
	static let useHost = developmentApiHost
	//static let useHost = productionApiHost
	
	static let baseUrl = useHost + apiVersion
	
	private init() { }
	
	
	
	public let projectSync = NWProjectSync()
	
	public func projectsApi() -> NWProjectSync {
		return projectSync
	}
	
}
