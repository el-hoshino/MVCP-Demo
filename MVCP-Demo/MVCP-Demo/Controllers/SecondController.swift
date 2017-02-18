//
//  SecondController.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
	
	lazy var pinView: UIView = {
		let view = UIView()
		view.backgroundColor = .blue
		return view
	}()
	
	override func viewDidLoad() {
		self.setupView()
		self.setupSubviews()
		self.setGestureRecognizers()
	}
	
}

extension SecondController {
	
	fileprivate func setupView() {
		self.view.backgroundColor = .gray
	}
	
}

extension SecondController {
	
	fileprivate func setGestureRecognizers() {
		
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap(sender:)))
		self.view.addGestureRecognizer(tapRecognizer)
		
	}
	
}

extension SecondController {
	
	fileprivate func setupSubviews() {
		self.view.addSubview(self.pinView)
	}
	
}

extension SecondController {
	
	@objc fileprivate func didTap(sender: UITapGestureRecognizer) {
		self.dismiss()
	}
	
	private func dismiss() {
		self.dismiss(animated: true, completion: nil)
	}
	
}
