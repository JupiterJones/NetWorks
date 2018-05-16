//
//  UIImage-extension.swift
//  NetWorks
//
//  Created by Jupiter on 12/7/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
	
	
	func scaleImageToFit(newSize: CGSize) -> UIImage {
		return scaleImageToSize(newSize: size, fill: false)
	}
	
	func scaleImageToFill(newSize: CGSize) -> UIImage {
		return scaleImageToSize(newSize: size, fill: true)
	}
	
	/// Scales an image to fit within a bounds with a size governed by the passed size. Also keeps the aspect ratio.
	/// Switch MIN to MAX for aspect fill instead of fit.
	///
	/// - parameter newSize: newSize the size of the bounds the image must fit within.
	///
	/// - returns: a new scaled image.

	func scaleImageToSize(newSize: CGSize, fill: Bool? = false) -> UIImage {
		var scaledImageRect = CGRect.zero
		
		let aspectWidth = newSize.width/size.width
		let aspectheight = newSize.height/size.height
		var aspectRatio: CGFloat
		if fill! {
			aspectRatio = max(aspectWidth, aspectheight)
		} else {
			aspectRatio = min(aspectWidth, aspectheight)
		}
		
		scaledImageRect.size.width = size.width * aspectRatio;
		scaledImageRect.size.height = size.height * aspectRatio;
		scaledImageRect.origin.x = (newSize.width - scaledImageRect.size.width) / 2.0;
		scaledImageRect.origin.y = (newSize.height - scaledImageRect.size.height) / 2.0;
		
		UIGraphicsBeginImageContext(newSize)
		draw(in: scaledImageRect)
		let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return scaledImage!
	}
}
