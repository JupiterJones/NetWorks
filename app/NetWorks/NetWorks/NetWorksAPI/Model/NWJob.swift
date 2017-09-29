//
//  NWJob.swift
//  NetWorks
//
//  Created by Jupiter on 24/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation

class NWJobType : NWObjectWithTitleAndComment {
	var lineItemTypes : [NWJobLineItemType] = []
}

class NWJobLineItemType : NWObjectWithTitleAndComment {
	
}

class NWJobLineItem : NWAbstractObject {
	var lineItemType : NWJobLineItemType?
	var note : String?
}

class NWJob : NWObjectWithTitleAndComment {
	var jobType: NWJobType?
	var client: String?
	var location: NWLocation?
	var asset: String?
}

class NWLocation : NWObjectWithTitleAndComment {
	var latitude: Float?
	var longitude: Float?
	var address: String?
}
