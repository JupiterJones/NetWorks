//
//  NWAbstractObject.swift
//  NetWorks
//
//  Created by Jupiter on 21/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation
import EVReflection

class NWAbstractObject: EVObject {
	var _className : String?
	
	required init() {
		super.init()
		_className = String(describing: Mirror(reflecting: self).subjectType)
	}
}

class NWIdentifiableObject : NWAbstractObject {
	var id = UUID().uuidString
	var uri : String?
}

class NWObjectWithTitleAndComment : NWIdentifiableObject {
	var title : String?
	var comment : String?
}
