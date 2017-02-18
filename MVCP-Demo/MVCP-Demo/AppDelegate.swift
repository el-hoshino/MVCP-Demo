//
//  AppDelegate.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
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


}

extension AppDelegate: PresentationDelegate {
	
	func nextPresentation(after currentController: UIViewController, userInfo: [String : Any]?) -> PresentationDelegate.Presentation? {
		switch currentController {
		case is ViewController:
			return self.makeFirstController(from: currentController, userInfo: nil)
			
		case is FirstController:
			return self.makeSecondController(from: currentController, userInfo: nil)
			
		case _:
			return nil
		}
	}
	
}

extension AppDelegate {
	
	fileprivate func makeFirstController(from controller: UIViewController, userInfo: [String: Any]?) -> PresentationDelegate.Presentation {
		
		let firstController = FirstController()
		return (firstController, nil)
		
	}
	
	fileprivate func makeSecondController(from controller: UIViewController, userInfo: [String: Any]?) -> PresentationDelegate.Presentation {
		
		let secondController = SecondController()
		
		let completion: (() -> Void)?
		if let firstController = controller as? FirstController, let tappedLocation = firstController.tappedLocation {
			completion = {
				secondController.pinView.bounds.size = CGSize(width: 100, height: 100)
				secondController.pinView.center = tappedLocation
			}
		} else {
			completion = nil
		}
		
		return (secondController, completion)
		
	}
	
}

