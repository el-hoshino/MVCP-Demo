//
//  ViewController.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	weak var presentationDelegate: PresentationDelegate? = {
		return UIApplication.shared.delegate as? AppDelegate
	}()

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
		
		if let presentation = self.presentationDelegate?.nextPresentation(after: self, userInfo: nil) {
			
			if let controller = presentation.controller as? Presentable {
				controller.presentationDelegate = self.presentationDelegate
			}
			
			self.present(presentation.controller, animated: false, completion: presentation.completion)
			
		}
	}
	
}

