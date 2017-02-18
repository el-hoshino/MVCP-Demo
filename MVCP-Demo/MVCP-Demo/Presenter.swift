//
//  Presenter.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

protocol Presenter: class {
	
	typealias Presentation = (controller: UIViewController, completion: (() -> Void)?)
	
	func nextPresentation(after currentController: UIViewController, userInfo: [String: Any]?) -> Presentation?
	
}
