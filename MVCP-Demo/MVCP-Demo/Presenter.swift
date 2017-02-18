//
//  Presenter.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

protocol Presenter: class {
	
	func nextPresentation(after currentController: UIViewController, userInfo: [String: Any]?) -> (controller: UIViewController, completion: (() -> Void)?)?
	
}
