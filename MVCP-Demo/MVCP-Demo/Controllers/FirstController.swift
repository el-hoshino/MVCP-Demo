//
//  FirstController.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

class FirstController: UIViewController, Presentee {
	
	weak var presenter: Presenter?
	var tappedLocation: CGPoint?
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.reset()
	}
	
	override func viewDidLoad() {
		self.setupView()
		self.setGestureRecognizers()
	}
	
}

extension FirstController {
	
	fileprivate func setupView() {
		self.view.backgroundColor = .white
	}
	
}

extension FirstController {
	
	fileprivate func setGestureRecognizers() {
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap(sender:)))
		self.view.addGestureRecognizer(tapRecognizer)
		
	}
	
}

extension FirstController {
	
	fileprivate func reset() {
		self.tappedLocation = nil
	}
	
}

extension FirstController {
	
	@objc fileprivate func didTap(sender: UITapGestureRecognizer) {
		self.setLocation(from: sender)
		self.presentNextController()
	}
	
	private func setLocation(from sender: UITapGestureRecognizer) {
		self.tappedLocation = sender.location(in: self.view)
	}
	
	private func presentNextController() {
		
		if let next = self.presenter?.nextPresentation(after: self, userInfo: nil) {
			
			if let presentee = next.controller as? Presentee {
				presentee.presenter = self.presenter
			}
			
			self.present(next.controller, animated: true, completion: next.completion)
			
		}
		
	}
	
}
