//
//  CameraViewController.swift
//  NetWorks
//
//  Created by Jupiter on 5/7/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreLocation
import CoreGraphics
import Alamofire
import Restofire
import XCGLogger

class CameraViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

	@IBOutlet weak var imageScrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!
	
	var workOrderLineItem: NWWorkOrderLineItem?
	var selectedImage: UIImage?
	var imageName: String?
	var isNew: Bool = true
	
	var newMedia: Bool?
	
	
	// MARK: - View Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		imageScrollView.minimumZoomScale = 1.0
		imageScrollView.maximumZoomScale = 6.0
		
		if imageName == nil {
			imageName = newImageName()
		}
		
		startFetchingLocation()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		if selectedImage != nil {
			imageView.image = selectedImage
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if isMovingFromParentViewController {
			log.verbose("back button pressed")
			// Save any changes
			//uploadImage(workOrderLineItem: workOrderLineItem!, image: imageView.image!)
			if isNew {
				uploadImageDirectly()
			}
			stopFetchingLocation()
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return imageView
	}


	// MARK: - Image Loading
	

	
	
	
	// MARK: - Location Manager
	
	func locationManager() -> NWLocationManager {
		return (UIApplication.shared.delegate as! AppDelegate).locationManager
	}
	
	func startFetchingLocation() {
		locationManager().startFetchingLocation()
	}
	
	func stopFetchingLocation() {
		locationManager().stopFetchingLocation()
	}
	
	func location() -> CLLocation? {
		return locationManager().location
	}
	
	func placemark() -> CLPlacemark? {
		return locationManager().placemark
	}
	
	
	
	
	
	
    // MARK: - Camera / Photo Library
	
	
	@IBAction func useCamera(_ sender: Any) {
		if UIImagePickerController.isSourceTypeAvailable(
			UIImagePickerControllerSourceType.camera) {
			
			let imagePicker = UIImagePickerController()
			
			imagePicker.delegate = self
			imagePicker.sourceType =
				UIImagePickerControllerSourceType.camera
			imagePicker.mediaTypes = [kUTTypeImage as String]
			imagePicker.allowsEditing = false
			
			self.present(imagePicker, animated: true,
			             completion: nil)
			newMedia = true
		}
	}
	
	@IBAction func cameraRoll(_ sender: Any) {
		if UIImagePickerController.isSourceTypeAvailable(
			UIImagePickerControllerSourceType.savedPhotosAlbum) {
			let imagePicker = UIImagePickerController()
			
			imagePicker.delegate = self
			imagePicker.sourceType =
				UIImagePickerControllerSourceType.photoLibrary
			imagePicker.mediaTypes = [kUTTypeImage as String]
			imagePicker.allowsEditing = false
			self.present(imagePicker, animated: true,
                completion: nil)
			newMedia = false
		}
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		let mediaType = info[UIImagePickerControllerMediaType] as! NSString
		//log.verbose("Image info: \(info)")
		self.dismiss(animated: true, completion: nil)
		
		if mediaType.isEqual(to: kUTTypeImage as String) {
			selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
			
			imageView.image = selectedImage
			
			isNew = true
			
			if (newMedia == true) {
				selectedImage = addWatermarkToImage(image: selectedImage!)
				imageView.image = selectedImage
				UIImageWriteToSavedPhotosAlbum(selectedImage!, self, #selector(CameraViewController.image(image:didFinishSavingWithError:contextInfo:)), nil)
				
			} else if mediaType.isEqual(to: kUTTypeMovie as String) {
				// Code to support video here
				let alert = UIAlertController(title: "Video Not Supported", message: "You provided a video. Please take a photo.", preferredStyle: UIAlertControllerStyle.alert)
				let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
				alert.addAction(cancelAction)
				self.present(alert, animated: true, completion: nil)
			}
		}
	}
	
	@objc func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer) {
		
		if error != nil {
			let alert = UIAlertController(title: "Save Failed", message: "Failed to save image", preferredStyle: UIAlertControllerStyle.alert)
			let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
			alert.addAction(cancelAction)
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		self.dismiss(animated: true, completion: nil)
	}
	
	
	
	
	
	
	
	// MARK: - Image generation and saving
	
	func addWatermarkToImage(image: UIImage) -> UIImage {
		
		/*

		--------------------------- <- Padding
		|-------------------------| <- Padding
		||                       || <- Logo
		||                       ||
		|-------------------------| <- Padding
		|-------------------------|
		||                       || <- Title
		|-------------------------|
		|-------------------------|
		||                       || <- Latitude
		||                       || <- Longitude
		||                       || <- Placemark string
		|-------------------------|
		|-------------------------|
		||                       || <- Comment
		|-------------------------|
		--------------------------- <- Padding

		*/
		
		let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
		let padding = 10
		let panelWidth = 500
		let panelHeight = 240
		let infoPanelRect = CGRect(x: padding, y: padding, width: panelWidth + padding, height: panelHeight + padding)
		let logoRect = CGRect(x: padding * 2, y: padding * 2, width: panelWidth - (padding * 2), height: 80)
		let logoImage = UIImage(named: "5smithsWhite")?.scaleImageToFit(newSize: logoRect.size)
		
		let boldFont = UIFont.boldSystemFont(ofSize: 14)
		let plainFont = UIFont.systemFont(ofSize: 12)
		
		let whiteColor = UIColor.white
		let transparentBlack = UIColor.black.withAlphaComponent(0.7)
		
		let scale = UIScreen.main.scale
		UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
		let context = UIGraphicsGetCurrentContext()!
		
		image.draw(in: rect, blendMode: .normal, alpha: 1)
		
		context.setFillColor(transparentBlack.cgColor)
		context.fill(infoPanelRect)
		
		logoImage?.draw(in: logoRect)
		let logoBottom = logoRect.height + CGFloat(padding * 2)
		
		let workOrderLabel = workOrderLineItem!.workOrder!.title! + " / " + workOrderLineItem!.jobLineItem!.lineItemType!.title!
		workOrderLabel.draw(at: CGPoint(x: 20, y: (logoBottom + 30)), withAttributes: [NSAttributedStringKey.font:boldFont, NSAttributedStringKey.foregroundColor:whiteColor])

		let date = Date()
		let formatter = DateFormatter();
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ";
		let defaultTimeZoneStr = formatter.string(from: date);
		defaultTimeZoneStr.draw(at: CGPoint(x: 20, y: (logoBottom + 60)), withAttributes: [NSAttributedStringKey.font:plainFont, NSAttributedStringKey.foregroundColor:whiteColor])
		
		let latitudeLabel = "Latitude: \(location()?.coordinate.latitude ?? 0)" as NSString
		latitudeLabel.draw(at: CGPoint(x: 20, y: (logoBottom + 80)), withAttributes: [NSAttributedStringKey.font:plainFont, NSAttributedStringKey.foregroundColor:whiteColor])
		
		let longitudeLabel = "Longitude: \(location()?.coordinate.longitude ?? 0)" as NSString
		longitudeLabel.draw(at: CGPoint(x: 20, y: (logoBottom + 100)), withAttributes: [NSAttributedStringKey.font:plainFont, NSAttributedStringKey.foregroundColor:whiteColor])
		
		if let currentPlacemark = placemark() {
			let placemarkLabel = (currentPlacemark.addressDictionary?["FormattedAddressLines"] as! NSArray).componentsJoined(by: ", ")
			placemarkLabel.draw(at: CGPoint(x: 20, y: (logoBottom + 120)), withAttributes: [NSAttributedStringKey.font:plainFont, NSAttributedStringKey.foregroundColor:whiteColor])
		}
		
		let result = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()
		
		return result
	}
	
	func newImageTitle() -> String {
		let j = workOrderLineItem?.workOrder?.job?.uri!
		let wo = workOrderLineItem!.uri!
		let fc = String(workOrderLineItem!.files.count + 1)
		// let cn = ""
		//return j! + "-" + wo + "-" + cn + "." + fc
		return j! + "-" + wo + "." + fc
	}
	
	func newImageName() -> String {
		return newImageTitle() + ".jpeg"
	}

	func newThumbnailName() -> String {
		return newImageTitle() + ".thumb.jpeg"
	}

	
	func saveImageAndThumbnail(image: UIImage) {
		
		let path = workOrderLineItem?.localDirectory()

		let thumbnailRect = CGSize(width: 128, height: 128)
		let thumbnailImage = image.scaleImageToFill(newSize: thumbnailRect)
		let thumbnailUrl = path?.appendingPathComponent(newThumbnailName())

		
		let imageUrl = path?.appendingPathComponent(newImageName())
		let filemgr = FileManager.default
		
		// Ensure the directory
		do {
			try filemgr.createDirectory(at: path!, withIntermediateDirectories: true, attributes: nil)
		} catch let error as NSError {
			log.error("Failed to create directory: \(error.localizedDescription)")
		}
		
		// Save the image and thumbnail
		do {
			var imageData = UIImageJPEGRepresentation(image, 0.6)
			try imageData?.write(to: imageUrl!)
			
			imageData = UIImageJPEGRepresentation(thumbnailImage, 0.6)
			try imageData?.write(to: thumbnailUrl!)
			
		} catch {
			log.error("Failed to save image and/or thumbnail")
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	func uploadImage(workOrderLineItem: NWWorkOrderLineItem, image: UIImage) {
		NWPostWorkOrderLineItemImageService(workOrderLineItem: workOrderLineItem, image: image).executeTask() {
			guard let model = $0.result.value else { return }
			log.verbose("saveLineItemImage - result: \(model)")
		}
	}
	
	
		
		
	
	
	func uploadImageDirectly() {
		
		// If no image has been taken
		guard let checkImage = self.imageView.image else {
			return
		}
		
		let uploadUrl = (Restofire.defaultConfiguration.baseURL)! + "postWorkOrderLineItemImage"
		//let uploadUrl = "http://dev.api.networks.tai.earth/1.0/postWorkOrderLineItemImage"
		log.verbose("upload url: \(uploadUrl)")
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		
		var headers: HTTPHeaders = [:]
		if let authorizationHeader = Request.authorizationHeader(user: "apiKey", password: apiKey!) {
			headers[authorizationHeader.key] = authorizationHeader.value
		}
		
		let parameters = [
			"job": workOrderLineItem?.workOrder?.job?.id,
			"workOrder": workOrderLineItem?.workOrder?.id,
			"lineItem": workOrderLineItem?.id
		]
		
		let imageData = UIImageJPEGRepresentation(checkImage, 0.6)
		let imagePath = workOrderLineItem?.localDirectory()
		let imageUrl = imagePath?.appendingPathComponent(newImageName())
		let filemgr = FileManager.default
		
		do {
			try filemgr.createDirectory(at: imagePath!, withIntermediateDirectories: true, attributes: nil)
		} catch let error as NSError {
			log.error("Failed to create directory: \(error.localizedDescription)")
		}
		
		do {
			try imageData?.write(to: imageUrl!)
		} catch {
			log.error("Failed to save file: \(String(describing: imageUrl))")
		}
		
		Alamofire.upload(
			multipartFormData: { multipartFormData in
				
				multipartFormData.append(imageData!, withName: "file", fileName: self.imageName!, mimeType: "image/jpeg")
				
				for (key, value) in parameters {
					multipartFormData.append((value?.data(using: String.Encoding.utf8)!)!, withName: key)
				}
			},
			to: uploadUrl,
			headers: headers,
			encodingCompletion: { encodingResult in
				switch encodingResult {
				case .success(let upload, _, _):
					upload.responseJSON { response in
						log.verbose(response)
					}
				case .failure(let encodingError):
					log.verbose(encodingError)
				}
			}
		)
	}
	
	
	func logProgress(fractionCompleted: Float) {
		log.debug("Upload Progress: \(fractionCompleted)")
	}

}


