//
//  Presentee.swift
//  MVCP-Demo
//
//  Created by 史翔新 on 2017/02/18.
//  Copyright © 2017年 crazism.net. All rights reserved.
//

import UIKit

protocol Presentee: class {
	var presenter: Presenter? { get set }
}
