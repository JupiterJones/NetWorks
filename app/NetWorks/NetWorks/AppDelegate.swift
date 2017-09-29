//
//  AppDelegate.swift
//  NetWorks
//
//  Created by Jupiter on 10/3/17.
//  Copyright © 2017 MyNation. All rights reserved.
//

import UIKit
import XCGLogger
import AlamofireNetworkActivityIndicator
import AlamofireImage


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

	var window: UIWindow?
	var locationManager = NWLocationManager()
	var api: NetWorksAPI = NetWorksAPI()
	var tabBarController: UITabBarController?
	
	let documentsDirectory: URL = {
		let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return urls[urls.endIndex - 1]
	}()
	
	let cacheDirectory: URL = {
		let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
		return urls[urls.endIndex - 1]
	}()
	
	let imageCache = AutoPurgingImageCache (
		memoryCapacity: 100 * 1024 * 1024,
		preferredMemoryUsageAfterPurge: 60 * 1024 * 1024
	)


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		NetworkActivityIndicatorManager.shared.isEnabled = true
		NetworkActivityIndicatorManager.shared.startDelay = 0
		NetworkActivityIndicatorManager.shared.completionDelay = 1.0
		
		tabBarController = window?.rootViewController as! UITabBarController
		let splitViewController = tabBarController?.viewControllers?.first as! UISplitViewController
		let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
		navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
		splitViewController.delegate = self
				
		log.verbose("NetWorks has started", userInfo: Dev.jupiter | Tag.sensitive)
		if api.apiKey() == nil  {
			// Setup user
			tabBarController?.selectedIndex = 2
			let profileController = tabBarController?.viewControllers?.last as! UINavigationController
			profileController.visibleViewController?.performSegue(withIdentifier: "setupSegue", sender: self)
		}

		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	// MARK: - Split view
	
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
		guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
		guard let topAsDetailController = secondaryAsNavController.topViewController as? WorkOrderController else { return false }
		if topAsDetailController.workOrder == nil {
			// Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
			return true
		}
		return false
	}
}

// MARK: - Logging Setup

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let log: XCGLogger = {
	// Setup XCGLogger
	let log = XCGLogger.default
	
	#if USE_NSLOG // Set via Build Settings, under Other Swift Flags
		log.remove(destinationWithIdentifier: XCGLogger.Constants.baseConsoleDestinationIdentifier)
		log.add(destination: AppleSystemLogDestination(identifier: XCGLogger.Constants.systemLogDestinationIdentifier))
		log.logAppDetails()
	#else
		let logPath: URL = appDelegate.cacheDirectory.appendingPathComponent("NetWorks.log")
		log.setup(level: .verbose, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: logPath)
		
		// Add colour (using the ANSI format) to our file log, you can see the colour when `cat`ing or `tail`ing the file in Terminal on macOS
		// This is mostly useful when testing in the simulator, or if you have the app sending you log files remotely
		if let fileDestination: FileDestination = log.destination(withIdentifier: XCGLogger.Constants.fileDestinationIdentifier) as? FileDestination {
			let ansiColorLogFormatter: ANSIColorLogFormatter = ANSIColorLogFormatter()
			ansiColorLogFormatter.colorize(level: .verbose, with: .colorIndex(number: 244), options: [.faint])
			ansiColorLogFormatter.colorize(level: .debug, with: .black)
			ansiColorLogFormatter.colorize(level: .info, with: .blue, options: [.underline])
			ansiColorLogFormatter.colorize(level: .warning, with: .red, options: [.faint])
			ansiColorLogFormatter.colorize(level: .error, with: .red, options: [.bold])
			ansiColorLogFormatter.colorize(level: .severe, with: .white, on: .red)
			fileDestination.formatters = [ansiColorLogFormatter]
		}
		
	#endif
	
	let emojiLogFormatter = PrePostFixLogFormatter()
	emojiLogFormatter.apply(prefix: "🗯 ", postfix: "", to: .verbose)
	emojiLogFormatter.apply(prefix: "🔹 ", postfix: "", to: .debug)
	emojiLogFormatter.apply(prefix: "ℹ️ ", postfix: "", to: .info)
	emojiLogFormatter.apply(prefix: "⚠️ ", postfix: "", to: .warning)
	emojiLogFormatter.apply(prefix: "‼️ ", postfix: "", to: .error)
	emojiLogFormatter.apply(prefix: "💣 ", postfix: "", to: .severe)
	log.formatters = [emojiLogFormatter]
	
	return log
}()

// Create custom tags for your logs
extension Tag {
	static let sensitive = Tag("sensitive")
	static let ui = Tag("ui")
	static let data = Tag("data")
	static let api = Tag("api")
}

// Create custom developers for your logs
extension Dev {
	static let jupiter = Dev("jupiter")
	static let yogie = Dev("yogie")
}
