//
//  NWOrganisationModel.swift
//  NetWorks
//
//  Created by Jupiter on 24/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation

class NWOrganisationModel : NWAbstractObject {
	var organisation: NWOrganisation?
	var contractor: NWContractor?
	var workOrders = [NWWorkOrder]()
	
	/*
	init(organisation: NWOrganisation) {
		self.organisation = organisation
	}
	*/

}
