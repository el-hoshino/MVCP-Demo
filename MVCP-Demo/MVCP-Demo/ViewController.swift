//
//  ViewController.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	weak var presenter: Presenter? = {
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
		
		if let presentation = self.presenter?.nextPresentation(after: self, userInfo: nil) {
			
			if let presentee = presentation.controller as? Presentee {
				presentee.presenter = self.presenter
			}
			
			self.present(presentation.controller, animated: false, completion: presentation.completion)
			
		}
	}
	
}

