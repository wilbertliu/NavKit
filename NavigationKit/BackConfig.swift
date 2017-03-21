//
//  BackConfig.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/19/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

/// It holds all required things for a type to specify the requirement of
/// how the back button looks like and behave.
@objc public protocol BackConfig {

    // MARK: - Optional

    /// Specify this property to determine the image that would be used as
    /// the back button's image.
    @objc optional var backImage: UIImage { get }

    /// Specify this property to determine the text that would be used at
    /// the right of the back button's image.
    @objc optional var backText: String { get }

}
