//
//  NWLocationManager.swift
//  NetWorks
//
//  Created by Jupiter on 12/7/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation
import CoreLocation


class NWLocationManager: NSObject, CLLocationManagerDelegate {

	// MARK: - Instance Variables

	var locationManager = CLLocationManager()
	var location: CLLocation?
	var placemark: CLPlacemark?
	
	
	// MARK: - NWLocationManager API
	
	func fetchLocationInformation() {
		startFetchingLocation()
	}

	func startFetchingLocation() {
		
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestWhenInUseAuthorization()
		
		if CLLocationManager.locationServicesEnabled() {
			//log.debug("Starting Location Search")
			locationManager.delegate = self
			locationManager.startUpdatingLocation()
		} else {
			//Location service disabled"
			log.debug("Location service disabled")
		}
		
	}
	
	func stopFetchingLocation() {
		//log.debug("Stopping Location Search")
		locationManager.stopUpdatingLocation()
	}
	
	
	
	
	// MARK: - CLLocationManagerDelegate
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		location = locations.last
		CLGeocoder().reverseGeocodeLocation(location!, completionHandler: {(placemarks, error) -> Void in
			
			if error != nil {
				log.error("Reverse geocoder failed with error" + (error?.localizedDescription)!)
				return
			}
			
			if (placemarks?.count)! > 0 {
				self.placemark = placemarks?[0]
				//log.verbose("Placemark: \(String(describing: self.placemark))")
			}
			else {
				log.error("Problem with the data received from geocoder")
			}
		})
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		log.debug("Location Manager Failed")
	}

}
