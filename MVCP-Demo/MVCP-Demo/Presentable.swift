//
//  Presentable.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

protocol Presentable: class {
	
	var presentationDelegate: PresentationDelegate? { get set }
	
	func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)?)
	
}
