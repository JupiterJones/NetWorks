//
//  NWSyncBase.swift
//  NetWorks
//
//  Created by Jupiter on 1/2/18.
//  Copyright © 2018 MyNation. All rights reserved.
//

import Foundation
import CoreData
import Sync
import Alamofire
import XCGLogger

public class NWSyncBase {
	
	var networkManager: NetworkReachabilityManager
	let dataStack: DataStack

	init() {
		self.dataStack = DataStack(modelName: "NetWorksDataModel")
		self.networkManager = NetworkReachabilityManager(host: NWAPI.useHost)!
		networkManager.listener = { status in
			if self.networkManager.isReachable {
				
				switch status {
					
				case .reachable(.ethernetOrWiFi):
					XCGLogger.debug("The network is reachable over the WiFi connection")
					
				case .reachable(.wwan):
					XCGLogger.debug("The network is reachable over the WWAN connection")
					
				case .notReachable:
					XCGLogger.debug("The network is not reachable")
					
				case .unknown :
					XCGLogger.debug("It is unknown whether the network is reachable")
					
				}
			}
		}
		networkManager.startListening()
	}

}
