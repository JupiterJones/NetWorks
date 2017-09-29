//
//  NWWorkOrder.swift
//  NetWorks
//
//  Created by Jupiter on 14/3/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation
import UIKit

class NWWorkOrder : NWObjectWithTitleAndComment {
	var job: NWJob?
	var scheduleDate: Date?
	var completionDate: Date?
	var workflow: String?
	var hasPreStart: Bool?
	var preStartDocumentNameForToday: String?
	var numberOfLineItems = 0
	var lineItems = [NWWorkOrderLineItem]()
	
	func localDirectory() -> URL {
		var localDirectory = (UIApplication.shared.delegate as! AppDelegate).documentsDirectory
		localDirectory.appendPathComponent(uri!)
		return localDirectory
	}
}
