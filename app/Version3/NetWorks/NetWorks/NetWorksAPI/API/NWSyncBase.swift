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
import CoreTelephony
import Hydra

public class NWSyncBase {
	
	var networkManager: NetworkReachabilityManager
	var networkAvailble = false
	var dataStack: DataStack
	
	init() {
		self.dataStack = DataStack(modelName: "NetWorksDataModel")
		self.networkManager = NetworkReachabilityManager(host: NWAPI.useHost)!
		networkManager.listener = { status in
			if self.networkManager.isReachable {
				
				switch status {
					
				case .reachable(.ethernetOrWiFi):
					XCGLogger.debug("The network is reachable over the WiFi connection")
					self.networkAvailble = true
					
				case .reachable(.wwan):
					XCGLogger.debug("The network is reachable over the WWAN connection")
					self.networkAvailble = false
					
				case .notReachable:
					XCGLogger.debug("The network is not reachable")
					self.networkAvailble = false
					
				case .unknown :
					XCGLogger.debug("It is unknown whether the network is reachable")
					self.networkAvailble = false
				}
			}
		}
		networkManager.startListening()
		//NotificationCenter.default.addObserver(self, selector: #selector(contextObjectsDidChange(_:)), name: Notification.Name.NSManagedObjectContextObjectsDidChange, object: nil)

	}
	
	public func managedObjectContext() -> NSManagedObjectContext {
		return dataStack.mainContext
	}
	
	@objc func contextObjectsDidChange(_ notification: Notification) {
		log.verbose("Object has changed: \(notification)")
	}
	
	func apiKey() -> String {
		return NWAPI.shared.authorisation().apiKey()
	}
	
	
	func ifMobileDataEnabled() -> Promise<Bool> {
		return Promise<Bool> (in: .background, { resolve, reject, _ in
			//var cellularDataRestrictedState = CTCellularDataRestrictedState.restrictedStateUnknown
			let cellState = CTCellularData.init()
			cellState.cellularDataRestrictionDidUpdateNotifier = { (dataRestrictedState) in
				log.verbose("cellularDataRestrictedState: " + "\(dataRestrictedState == .restrictedStateUnknown ? "unknown" : dataRestrictedState == .restricted ? "restricted" : "not restricted")")
				resolve(dataRestrictedState != .restrictedStateUnknown && dataRestrictedState != .restricted)
			}
		})
	}

}
