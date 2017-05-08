//
//  ViewController.swift
//  NavKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import UIKit
import NavKit

class ViewController: UIViewController, CustomizableNavigation, UIGestureRecognizerDelegate {
    var barBackgroundColor: UIColor = .white
    var isBarUsingBottomShadow: Bool = true
    var titleColor: UIColor = .black
    var titleFont: UIFont = .systemFont(ofSize: 17)
    var backImage: UIImage?
    var backText: String?
    var isUsingInteractivePopGesture: Bool = true
}
