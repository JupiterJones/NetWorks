//
//  NWWorkOrderLineItem.swift
//  NetWorks
//
//  Created by Jupiter on 12/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class NWWorkOrderLineItem : NWObjectWithTitleAndComment {
	var workOrder : NWWorkOrder?
	var jobLineItem : NWJobLineItem?
	var quantity : Float = 0
	var complete : Float = 0
	var tests = [NWTest]()
	var downloadUrl: String?
	var files = [String]()
	
	func localDirectory() -> URL {
		var localDirectory = (workOrder?.localDirectory())!
		localDirectory.appendPathComponent((jobLineItem?.lineItemType?.uri)!)
		return localDirectory
	}
}
