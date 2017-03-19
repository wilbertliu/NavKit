//
//  CustomizedNavigation.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

@objc public protocol CustomizedNavigation {

    @objc optional var barBackgroundColor: UIColor { get }
    @objc optional var isBarTranslucent: Bool { get }
    @objc optional var isBarUsingShadow: Bool { get }
    @objc optional var titleColor: UIColor { get }
    @objc optional var titleFont: UIFont { get }

}
