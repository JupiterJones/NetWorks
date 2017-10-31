//
//  NetWorksAPI.swift
//  NetWorks
//
//  Created by Jupiter on 12/3/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage
import Restofire
import SwiftyJSON
import XCGLogger
import KeychainSwift

class NetWorksAPI {
	
	// MARK: - Instance Variables
	
	let productionApiHost = "api.networks.tai.earth"
	let developmentApiHost = "dev.api.networks.tai.earth"
	
	var baseUrl: String?
	var organisation: NWOrganisation?
	var workOrders = [NWWorkOrder]()
	var imageDownloader = ImageDownloader.default
	var networkManager: NetworkReachabilityManager?
	
	// MARK: - Initialisation
	
	init() {
		// Create a shared URL cache
		let memoryCapacity = 50 * 1024 * 1024; // 20 MB
		let diskCapacity = 100 * 1024 * 1024; // 100 MB
		let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "networks_cache")
		
		let apiHost = productionApiHost
		//let apiHost = developmentApiHost
		
		Restofire.defaultConfiguration.baseURL = "http://\(apiHost)/1.0/"
		Restofire.defaultConfiguration.headers = ["Content-Type": "application/json"]
		Restofire.defaultConfiguration.validation.acceptableStatusCodes = Array(200..<300)
		Restofire.defaultConfiguration.validation.acceptableContentTypes = ["application/json"]
		Restofire.defaultConfiguration.retry.retryErrorCodes = [.timedOut,.networkConnectionLost]
		Restofire.defaultConfiguration.retry.retryInterval = 20
		Restofire.defaultConfiguration.retry.maxRetryAttempts = 10
		
		let sessionConfiguration = URLSessionConfiguration.default
		sessionConfiguration.timeoutIntervalForRequest = 7
		sessionConfiguration.timeoutIntervalForResource = 7
		sessionConfiguration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
		sessionConfiguration.urlCache = cache
		sessionConfiguration.requestCachePolicy = .useProtocolCachePolicy
		
		Restofire.defaultConfiguration.sessionManager = Alamofire.SessionManager(configuration: sessionConfiguration)
		
		networkManager = NetworkReachabilityManager(host: apiHost)
		networkManager?.listener = { status in
			log.info("Network Status Changed: \(status)")
		}
		networkManager?.startListening()
	}

	// MARK: - Connecting
	func connect() {
		let key = apiKey()
		log.info("Device has apiKey = \(String(describing: key))", userInfo: Dev.jupiter | Tag.api)
	}
	
	// MARK: - API Commands
	func getLatestAPIInformation() {
		// Retrive the API information for this app version in case there has been a server update.
		NWGetAPIInformationService(appVersion: "1.0").executeTask() {
			if let value = $0.result.value {
				let jsonModel = JSON(value)
				self.baseUrl = jsonModel["apis"][0]["baseUrl"].stringValue
				log.verbose("Latest API baseUrl = \(String(describing: self.baseUrl))", userInfo: Dev.jupiter | Tag.api)
			}
		}
	}
	
	func getInitialModel() {
		//self .credential(user: "user", apiKey: "1234567890")
		// Retrive the model for this api.
		NWGetModelService().executeTask() {
			if let value = $0.result.value {
				let jsonModel = JSON(value)
				log.verbose("Initial Model = \(String(describing: jsonModel))", userInfo: Dev.jupiter | Tag.api)
			}
		}
	}
	
	func apiKey() -> String? {
		let keychain = KeychainSwift(keyPrefix: "NetWorks_")
		let key = UIDevice.current.identifierForVendor!.uuidString
		let apiKey = keychain.getData(key)
		if keychain.lastResultCode != noErr {
			/* Report error */
			log.info("failed to get apiKey for id = \(key)", userInfo: Dev.jupiter | Tag.api)
			return nil
		} else {
			//log.info("device id key = \(key) value = \(apiKey)", userInfo: Dev.jupiter | Tag.api)
			return String(data: apiKey!, encoding: String.Encoding.utf8)
		}
	}
	
	func apiKey(uuid: UUID) {
		log.info("setting apiKey for uuid = \(uuid)", userInfo: Dev.jupiter | Tag.api)
		let keychain = KeychainSwift(keyPrefix: "NetWorks_")
		let key = UIDevice.current.identifierForVendor!.uuidString
		keychain.set(uuid.uuidString, forKey: key)
		let credential = URLCredential(user: "apiKey", password: uuid.uuidString, persistence: .forSession)
		Restofire.defaultConfiguration.authentication.credential = credential

	}
	
	
	func updateWorkOrders(from model: JSON) {
		if let results = model["workOrders"].array {
			var newWorkOrders = [NWWorkOrder]()
			for result in results {
				let newWorkOrder = workOrder(from: result)
				newWorkOrders.append(newWorkOrder)
			}
			log.warning("updateWorkOrders() - updated work orders to: \(newWorkOrders)", userInfo: Dev.jupiter | Tag.api)
			workOrders = newWorkOrders
		}
	}
	
	func workOrder(from model: JSON) -> NWWorkOrder {
		let workOrder = NWWorkOrder()
		workOrder.id = model["id"].stringValue
		workOrder.title = model["title"].stringValue
		workOrder.comment = model["comment"].stringValue
		workOrder.numberOfLineItems = model["numberOfLineItems"].intValue
		workOrder.workflow = model["workflow"].stringValue
		workOrder.hasPreStart = model["hasPreStart"].boolValue
		workOrder.preStartDocumentNameForToday = model["preStartDocumentNameForToday"].stringValue
		workOrder.uri = model["uri"].stringValue
		workOrder.job = job(from: model["job"])
		
		if let results = model["lineItems"].array {
			for result in results {
				let newLineItem = workOrderLineItem(from: result)
				newLineItem.workOrder = workOrder
				workOrder.lineItems.append(newLineItem)
			}
		}
		
		return workOrder
	}
	
	func workOrderLineItem(from model: JSON) -> NWWorkOrderLineItem {
		let lineItem = NWWorkOrderLineItem()
		lineItem.id = model["id"].stringValue
		lineItem.quantity = model["quantity"].floatValue
		lineItem.complete = model["complete"].floatValue
		lineItem.jobLineItem = jobLineItem(from: model["jobLineItem"])
		lineItem.uri = model["uri"].stringValue
		lineItem.downloadUrl = model["downloadUrl"].stringValue
		
		if let results = model["files"].array {
			for result in results {
				lineItem.files.append(result.stringValue)
			}
		}
		
		if let results = model["tests"].array {
			for result in results {
				let newTest = test(from: result)
				lineItem.tests.append(newTest!)
			}
		}
		return lineItem
	}
	
	func test(from model: JSON) -> NWTest? {
		var test : NWTest?
		let className = model["_className"].stringValue
		if className == "NWTapsAndPortsTest" {
			test = tapsAndPortsTest(from: model)
		}
		return test
	}
	
	func tapsAndPortsTest(from model: JSON) -> NWTapsAndPortsTest {
		let test = NWTapsAndPortsTest()
		test.id = model["UuidString"].stringValue
		if let results = model["Taps"].array {
			for result in results {
				let newResult = tapResult(from: result)
				newResult.id = model["UuidString"].stringValue
				newResult.test = test
				test.taps.append(newResult)
			}
		}
		return test
	}
	
	func tapResult(from model: JSON) -> NWTapResult {
		let tapResult = NWTapResult()
		tapResult.tap = model["Tap"].stringValue
		if let results = model["Ports"].array {
			for result in results {
				let newResult = portResult(from: result)
				newResult.id = model["UuidString"].stringValue
				newResult.tap = tapResult
				tapResult.ports.append(newResult)
			}
		}
		return tapResult
	}
	
	func portResult(from model: JSON) -> NWPortResult {
		let portResult = NWPortResult()
		portResult.port = model["Port"].stringValue
		portResult.unit = model["Unit"].stringValue
		portResult.high = model["High"].floatValue
		portResult.low = model["Low"].floatValue
		return portResult
	}
	
	func jobLineItem(from model: JSON) -> NWJobLineItem {
		let lineItem = NWJobLineItem()
		lineItem.note =  model["note"].stringValue
		lineItem.lineItemType = jobLineItemType(from: model["lineItemType"])
		return lineItem
	}
	
	func jobLineItemTypes(from model: JSON) -> [NWJobLineItemType] {
		var lineItemTypes = [NWJobLineItemType]()
		
		if let results = model["lineItemTypes"].array {
			for result in results {
				let lineItemType = jobLineItemType(from: result)
				lineItemTypes.append(lineItemType)
			}
		}
		return lineItemTypes
	}
	
	
	func jobLineItemType(from model: JSON) -> NWJobLineItemType {
		let lineItemType = NWJobLineItemType()
		lineItemType.id = model["id"].stringValue
		lineItemType.title = model["title"].stringValue
		lineItemType.comment = model["comment"].stringValue
		lineItemType.uri = model["uri"].stringValue
		
		return lineItemType
	}
	
	func job(from model: JSON) -> NWJob {
		let job = NWJob()
		job.id = model["id"].stringValue
		job.location = location(from: model["location"])
		job.asset = model["asset"].stringValue
		job.client = model["client"].stringValue
		job.uri = model["uri"].stringValue
		
		return job
	}
	
	func location(from model: JSON) -> NWLocation {
		let location = NWLocation()
		location.id = model["id"].stringValue
		location.title = model["title"].stringValue
		location.comment = model["comment"].stringValue
		location.address = model["address"].stringValue
		location.latitude = model["latitude"].float
		location.longitude = model["longitude"].float
		
		return location
	}
	
	
	
	
	
}

// MARK: - API Calls

// GET Authorisation Key
struct NWGetAuthorisationService: Requestable {
	
	typealias Model = Any
	let encoding: ParameterEncoding = URLEncoding.default
	let path: String = "authorisation"
	var authCode: String?
	var headers: [String : String]?
	
	init(authCode: String) {
		self.authCode = authCode
		let auth = Alamofire.Request.authorizationHeader(user: "authCode", password: authCode)!
		self.headers = [auth.key: auth.value]
	}
}

// GET Profile Information
struct NWGetProfileService: Requestable, Authenticable {
	typealias Model = Any
	let encoding: ParameterEncoding = URLEncoding.default
	let path: String = "profile"
	var headers: [String : String]?
	
	init() {
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		let auth = Alamofire.Request.authorizationHeader(user: "apiKey", password: apiKey!)!
		self.headers = [auth.key: auth.value]
	}
}

// GET Job Line Items
class NWGetJobLineItemTypesService: Requestable {
	typealias Model = Any
	let encoding: ParameterEncoding = URLEncoding.default
	let path: String = "lineItemTypes"
	var headers: [String : String]?
	var parameters: Any?
	
	init(job: NWJob, searchString: String) {
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		let auth = Alamofire.Request.authorizationHeader(user: "apiKey", password: apiKey!)!
		self.headers = [auth.key: auth.value]
		self.parameters = [
			"jobId": (job.id),
			"searchString": searchString
		]
		log.debug("NWGetJobLineItemTypesService parameters: \(String(describing: self.parameters))")
	}
}


// GET WorkOrders
class NWGetWorkOrdersService: Requestable {
	typealias Model = Any
	let encoding: ParameterEncoding = URLEncoding.default
	let path: String = "workOrders"
	var headers: [String : String]?
	
	init() {
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		let auth = Alamofire.Request.authorizationHeader(user: "apiKey", password: apiKey!)!
		self.headers = [auth.key: auth.value]
	}
}


class NWSaveWorkOrderLineItemService: Requestable {
	let method: Alamofire.HTTPMethod = .put
	typealias Model = Any
	let encoding: ParameterEncoding = JSONEncoding.default
	let path: String = "saveWorkOrderLineItem"
	var parameters: Any?
	var headers: [String : String]?
	
	init(workOrderLineItem: NWWorkOrderLineItem) {
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		let auth = Alamofire.Request.authorizationHeader(user: "apiKey", password: apiKey!)!
		self.headers = [auth.key: auth.value]
		self.parameters = [
			"jobId": (workOrderLineItem.workOrder?.job?.id)!,
			"workOrderId": (workOrderLineItem.workOrder?.id)!,
			"lineItemId": workOrderLineItem.id,
			"lineItemTypeId": (workOrderLineItem.jobLineItem?.lineItemType?.id)!,
			"data": workOrderLineItem.toJsonString()
		]
	}
}




class NWPostWorkOrderLineItemImageService: Requestable {
	let method: Alamofire.HTTPMethod = .post
	typealias Model = Any
	let encoding: ParameterEncoding = URLEncoding.queryString
	let path: String = "postWorkOrderLineItemImage"
	var parameters: Any?
	var headers: [String : String]?
	
	init(workOrderLineItem: NWWorkOrderLineItem, image: UIImage) {
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		let auth = Alamofire.Request.authorizationHeader(user: "apiKey", password: apiKey!)!
		let imageData = UIImageJPEGRepresentation(image, 0.9)
		let base64String = imageData!.base64EncodedString(options: NSData.Base64EncodingOptions.endLineWithLineFeed) as NSString!
		
		self.headers = [auth.key: auth.value]
		self.parameters = [
			"job": (workOrderLineItem.workOrder?.job?.id)!,
			"workOrder": (workOrderLineItem.workOrder?.id)!,
			"lineItem": workOrderLineItem.id
		]
	}
}

class NWDeleteWorkOrderLineItemImageService: Requestable {
	let method: Alamofire.HTTPMethod = .delete
	typealias Model = Any
	let encoding: ParameterEncoding = URLEncoding.queryString
	let path: String = "deleteWorkOrderLineItemImage"
	var parameters: Any?
	var headers: [String : String]?
	
	init(workOrderLineItem: NWWorkOrderLineItem, imageName: String) {
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		let auth = Alamofire.Request.authorizationHeader(user: "apiKey", password: apiKey!)!
		
		self.headers = [auth.key: auth.value]
		self.parameters = [
			"job": (workOrderLineItem.workOrder?.job?.id)!,
			"workOrder": (workOrderLineItem.workOrder?.id)!,
			"lineItem": workOrderLineItem.id,
			"imageName" : imageName
		]
	}
}


// GET Latest API Information
struct NWGetAPIInformationService: Requestable {
	
	typealias Model = Any
	let encoding: ParameterEncoding = URLEncoding.default
	let path: String = "version"
	var appVersion: String?
	var parameters: Any?
	
	init(appVersion: String) {
		self.appVersion = appVersion
		self.parameters = ["appVersion": appVersion]
	}
}



// GET Latest API Information
struct NWGetModelService: Requestable {
	
	typealias Model = Any
	let path: String = "model"
}













