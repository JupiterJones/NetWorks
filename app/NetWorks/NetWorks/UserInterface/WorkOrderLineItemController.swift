//
//  WorkOrderLineItemController.swift
//  NetWorks
//
//  Created by Jupiter on 20/4/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import SwiftyJSON
import XCGLogger
import Alamofire
import AlamofireImage

import MobileCoreServices

class WorkOrderLineItemController: UITableViewController, UIImagePickerControllerDelegate, UIAlertViewDelegate, UINavigationControllerDelegate, UINavigationBarDelegate {

	let lineItemTypeIcon = UIImage.fontAwesomeIcon(name: .wrench, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
	
	var cameraUI: UIImagePickerController! = UIImagePickerController()
	
	var lineItem: NWWorkOrderLineItem! {
		didSet (newLineitem) {
			self.refreshUI()
		}
	}
	
	let placeholderImage = UIImage(named: "5SmithsBlack")
	
	func refreshUI() {
		// Update the UI for workOrder
		tableView.reloadData()
	}
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		self.title = lineItem.jobLineItem?.lineItemType?.title
		let apiKey = (UIApplication.shared.delegate as! AppDelegate).api.apiKey()
		ImageDownloader.default.addAuthentication(user: "apiKey", password: apiKey!)
		UIImageView.af_sharedImageDownloader.addAuthentication(user: "apiKey", password: apiKey!)
		log.verbose("Set ImageDownloader.default.addAuthentication with user: apiKey password: \(apiKey!)")
		
		self.navigationController?.setNavigationBarHidden(false, animated:false)
		
		//Create back button of type custom
		
		let myBackButton:UIButton = UIButton.init(type: .custom)
		myBackButton.addTarget(self, action: #selector(WorkOrderLineItemController.popToRoot(sender:)), for: .touchUpInside)
		myBackButton.setTitle("Back", for: .normal)
		myBackButton.setTitleColor(.blue, for: .normal)
		myBackButton.sizeToFit()
		
		//Add back button to navigationBar as left Button
		
		let myCustomBackButtonItem:UIBarButtonItem = UIBarButtonItem(customView: myBackButton)
		self.navigationItem.leftBarButtonItem  = myCustomBackButtonItem
    }
	
	func popToRoot(sender:UIBarButtonItem){
		if lineItem.jobLineItem?.lineItemType == nil {
			let ac = UIAlertController(title: "Can not save yet", message: "You must select a line item type for this new line item.", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "OK", style: .default))
			present(ac, animated: true)
		} else {
			_ = self.navigationController?.popToRootViewController(animated: true)
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if isMovingFromParentViewController {
			log.verbose("back button pressed")
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		refreshUI()
	}
	
	override func didMove(toParentViewController parent: UIViewController?) {
		if (!(parent?.isEqual(self.parent) ?? false)) {
			// Save any changes
			log.verbose("saving line item changes")
			saveLineItem(workOrderLineItem: lineItem)
		}
	}
	
	func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
		return lineItem.jobLineItem?.lineItemType != nil
	}
	
	// MARK: - Images and Image Cache
	
	func imageCache() -> AutoPurgingImageCache {
		return (UIApplication.shared.delegate as! AppDelegate).imageCache
	}
	
	func createThumbnail(image: Image, identifier: String) -> UIImage {
		let size = CGSize(width: 300.0, height: 165.0)
		let scaledImage = image.af_imageAspectScaled(toFill: size)
		return scaledImage
	}
	
	func cacheImage(image: Image, identifier: String) {
		imageCache().add(image, withIdentifier: identifier)
	}
	
	func imageFromCache(identifier: String) -> UIImage? {
		guard let image = imageCache().image(withIdentifier: identifier) else { return nil }
		return image
	}
	
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			// Work Order Line Item details
			return 3
		case 1:
			// Tests
			return lineItem.tests.count + 1
		case 2:
			// Images
			return lineItem.files.count + 1
		default:
			return lineItem.tests.count + 1
		}
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		
		switch section {
		case 0:
			return "Details"
		case 1:
			return "Tests"
		case 2:
			return "Images"
		default:
			return "Unknown"
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			return detailCell(indexPath: indexPath)
		case 1:
			return testCell(indexPath: indexPath)
		case 2:
			return imageCell(indexPath: indexPath)
		default:
			log.error("THIS SHOULD NOT HAVE HAPPENED!!!!!!!!!!!!!! PLEASE CHECK")
			return UITableViewCell()
		}
	}
	
	func detailCell(indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "lineItemTypeCell", for: indexPath)
			cell.textLabel?.text = lineItem.jobLineItem?.lineItemType?.title
			cell.detailTextLabel?.text = lineItem.jobLineItem?.lineItemType?.comment
			cell.imageView?.image = lineItemTypeIcon
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "quantityCell", for: indexPath)  as! TextInputTableViewCell
			cell.textField?.text = "\(lineItem.quantity)"
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "quantityCompleteCell", for: indexPath) as! TextInputTableViewCell
			cell.textField?.text = "\(lineItem.complete)"
			return cell
			
		default:
			return UITableViewCell()
		}
	}
	
	func testCell(indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "addTestCell", for: indexPath)
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
			let test = lineItem.tests[indexPath.row - 1]
			cell.textLabel?.text = test.title
			cell.detailTextLabel?.text = classLabel(object: test)
			return cell
		}
	}
	
	func classLabel(object: Any) -> String {
		let set = CharacterSet.uppercaseLetters
		let testType = String(describing: type(of: object))
		
		let startIndex = testType.index(testType.startIndex, offsetBy: 2)
		let testName = testType.substring(from: startIndex)
		
		var result = ""
		for char in testName.characters {
			if (set.contains(UnicodeScalar(String(char))!) && result.characters.count != 0) {
				result += " "
			}
			result += String(char)
		}
		return result
	}
	
	func imageCell(indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "addImageCell", for: indexPath)
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
			let fileName = lineItem.files[indexPath.row - 1]
			cell.textLabel?.text = fileName
			let imageUrl = URL(string: lineItem.downloadUrl! + "/" + fileName)

			// Image Downloader
			log.verbose("Loading image: " + (imageUrl?.absoluteString)!)
			let filter = AspectScaledToFitSizeFilter(size: CGSize(width: 64, height: 64))
			cell.imageView?.af_setImage(withURL: imageUrl!, placeholderImage: placeholderImage, filter: filter, imageTransition: .crossDissolve(0.2))
			
			return cell
		}
	}
	

	
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
		let result = (indexPath.section > 0) && (indexPath.row > 0)
        return result
    }
	

	
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
			switch indexPath.section {
			case 1:
				// Remove Test
				lineItem.tests.remove(at: indexPath.row - 1)
				tableView.deleteRows(at: [indexPath], with: .fade)
				break
			case 2:
				// Remove Image
				
				break
			default:
				break
			}
			
        }    
    }
	

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
		if segue.identifier == "lineItemTypeSegue" {
			(segue.destination as! JobLineItemTypesController).jobLineItem = lineItem.jobLineItem
			(segue.destination as! JobLineItemTypesController).job = lineItem.workOrder?.job
			
		}
		
		if (segue.identifier == "takePhotoSegue" || segue.identifier == "showPhotoSegue") {
			(segue.destination as! CameraViewController).workOrderLineItem = lineItem
		
		}
		
		if (segue.identifier == "showPhotoSegue") {
			let cell = sender as! UITableViewCell
			let selectedFileIndex = tableView.indexPath(for: cell)
			(segue.destination as! CameraViewController).imageName = lineItem.files[(selectedFileIndex?.row)! - 1]
			(segue.destination as! CameraViewController).selectedImage = cell.imageView?.image
			(segue.destination as! CameraViewController).isNew = false
			
		}
		
		if (segue.identifier == "showTestSegue") {
			log.verbose("Showing selected test")
			let cell = sender as! UITableViewCell
			let selectedTestIndex = tableView.indexPath(for: cell)
			if (selectedTestIndex?.row)! > 0 {
				let tests = lineItem.tests[(selectedTestIndex?.row)! - 1]
				log.verbose("Setting tests: \(tests)")
				(segue.destination as! TestTableViewController).tests = tests as! NWTapsAndPortsTest
				(segue.destination as! TestTableViewController).workOrderLineItem = lineItem
			}
		}
		
		if (segue.identifier == "newTestSegue") {
			
			(segue.destination as! TestTableViewController).tests = newTestObject() as! NWTapsAndPortsTest
			(segue.destination as! TestTableViewController).workOrderLineItem = lineItem
		}
		
	}
	
	func newTestObject() -> NWTest {
		// TODO Choose test type
		let newTest = NWTapsAndPortsTest()
		newTest.lineItem = lineItem
		newTest.title = classLabel(object: newTest)
		lineItem.tests.append(newTest)
		return newTest
	}
	
	// MARK: - Data Changes
	/*
	func valueChanged(cell: TextInputTableViewCell) {
		if let stringValue = cell.textField.text {
			if let floatValue = Float(stringValue) {
				if cell.reuseIdentifier == "quantityCompleteCell" {
					// Save data
					log.verbose("Vaue changed to: \(floatValue)")
					lineItem.complete = floatValue
					saveLineItem(workOrderLineItem: lineItem)
				}
			}
		}
	}*/
	
	@IBAction func valueChanged(_ sender: Any) {
		let changedCell = (sender as! UIView).superview?.superview?.superview as! TextInputTableViewCell
		let changedIndexPath = self.tableView.indexPath(for: changedCell)
		
		log.verbose("Updating at indexPath: \(changedIndexPath)")
		switch changedIndexPath!.row {
		case 1:
			if let fieldStringValue = changedCell.textField.text {
				if let floatValue = Float(fieldStringValue) {
					lineItem.quantity = floatValue
				}
			}
		case 2:
			if let fieldStringValue = changedCell.textField.text {
				if let floatValue = Float(fieldStringValue) {
					lineItem.complete = floatValue
				}
			}
		default:
			return
		}
	}
	
	func saveLineItem(workOrderLineItem: NWWorkOrderLineItem) {
		NWSaveWorkOrderLineItemService(workOrderLineItem: lineItem).executeTask() {
			guard let model = $0.result.value else { return }
			let response = JSON(model)
			log.verbose("Line Item Updated = \(response)")
		}
	}
	
	func uploadImage(workOrderLineItem: NWWorkOrderLineItem, image: UIImage) {
		NWPostWorkOrderLineItemImageService(workOrderLineItem: workOrderLineItem, image: image).executeTask() {
			guard let model = $0.result.value else { return }
			log.verbose("saveLineItemImage - result: \(model)")
		}
	}
	
	func removeImageNamed(imageName: String) {
		NWDeleteWorkOrderLineItemImageService(workOrderLineItem: lineItem, imageName: imageName).executeTask() {
			guard let model = $0.result.value else { return }
			log.verbose("deleteLineItemImage - result: \(model)")
		}
	}
	
	
	
	// MARK: - Adding Tests and Images
	
	@IBAction func addTest(_ sender: Any) {
	}
	
	@IBAction func addPhoto(_ sender: Any) {
		presentCamera()
	}

	
	func presentCamera() {
		
		if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
		{
			cameraUI = UIImagePickerController()
			cameraUI.delegate = self
			cameraUI.sourceType = UIImagePickerControllerSourceType.camera;
			cameraUI.mediaTypes = [kUTTypeImage as String]
			cameraUI.allowsEditing = false
			
			self.present(cameraUI, animated: true, completion: nil)
		}
		else
		{
			// error msg
		}
	}
	
	//Mark- UIImagePickerController Delegate
	
	func imagePickerControllerDidCancel(_ picker:UIImagePickerController)
	{
		log.verbose("Cancelled Photo Selection")
		self.dismiss(animated: true, completion: nil)
	}
	
	
	
	
	func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info:[String : Any])
	{
		log.verbose("Saved Photo")
		
		if(picker.sourceType == UIImagePickerControllerSourceType.camera)
		{
			// Access the uncropped image from info dictionary
			let imageToSave: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage //same but with different way
			
			//UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
			uploadImage(workOrderLineItem: lineItem, image: imageToSave)
			self.savedImageAlert()
			self.dismiss(animated: true, completion: nil)
		}
	}
	
	func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
		if let error = error {
			// we got back an error!
			let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "OK", style: .default))
			present(ac, animated: true)
		} else {
			let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "OK", style: .default))
			present(ac, animated: true)
		}
	}
	
	func savedImageAlert()
	{
		log.verbose("SavedImageAlert")
	}

}
