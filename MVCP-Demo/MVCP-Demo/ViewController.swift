//
//  ViewController.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.presentController()
	}
	
}

extension ViewController {
	
	fileprivate func presentController() {
		
		let firstController = FirstController()
		firstController.presentationDelegate = self
		
		self.present(firstController, animated: false, completion: nil)
		
	}
	
}

extension ViewController: PresentationDelegate {
	
	func nextPresentation(after currentController: UIViewController, userInfo: [String : Any]?) -> PresentationDelegate.Presentation? {
		switch currentController {
		case is FirstController:
			return self.makeSecondController(from: currentController, userInfo: nil)
			
		case _:
			return nil
		}
	}
	
}

extension ViewController {
	
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
