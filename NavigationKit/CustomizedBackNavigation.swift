//
//  CustomizedBackNavigation.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/19/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

@objc public protocol CustomizedBackNavigation {

    @objc optional var backImage: UIImage { get }
    @objc optional var backText: String { get }

}
