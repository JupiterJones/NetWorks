//
//  TestResults.swift
//  NetWorks
//
//  Created by Jupiter on 8/7/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation


class NWTest : NWObjectWithTitleAndComment {
	var lineItem : NWWorkOrderLineItem?
}


class NWTapsAndPortsTest : NWTest {
	var taps = [NWTapResult]()
}



class NWTestResult : NWIdentifiableObject {
}


class NWTapResult : NWTestResult {
	var test : NWTapsAndPortsTest?
	var tap = ""
	var ports = [NWPortResult]()
}


class NWPortResult : NWTestResult {
	var tap : NWTapResult?
	var port = ""
	var unit = ""
	var high : Float = 0.0
	var low : Float = 0.0
}
