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
	
	private static let developmentUrl = "http://dev.api.networks.tai.earth/2.0"
	private static let productionUrl = "http://api.networks.tai.earth/2.0"
	
	static let baseUrl = developmentUrl
	//static let baseUrl = self.productionUrl
	
	private init() { }
	
	
	
	public let projectSync = NWProjectSync()
	
	public func projectsApi() -> NWProjectSync {
		return projectSync
	}
	
}
