//
//  FirstController.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

class FirstController: UIViewController, Presentable {
	
	weak var presentationDelegate: PresentationDelegate?
	var tappedLocation: CGPoint?
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.reset()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
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
		
		if let next = self.presentationDelegate?.nextPresentation(after: self, userInfo: nil) {
			
			if let controller = next.controller as? Presentable {
				controller.presentationDelegate = self.presentationDelegate
			}
			
			self.present(next.controller, animated: true, completion: next.completion)
			
		}
		
	}
	
}
