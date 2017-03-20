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

    /// Specify this property to determine the image that would be used as
    /// the back button's image.
    @objc optional var backImage: UIImage { get }

    /// Specify this property to determine the text that would be used at
    /// the right of the back button's image.
    @objc optional var backText: String { get }

    /// It stores a type that conforms to BackActionConfig protocol
    /// that would be used to setup custom action of back button.
    @objc var backActionConfig: BackActionConfig? { get set }

    /// Required initializer to set whether or not the BackConfig type has
    /// a custom back action configuration that would be used as an action
    /// when the back button has tapped.
    ///
    /// - Parameter backActionConfig: A type that conforms to BackActionConfig protocol.
    /// Set nil if you don't want to have a custom action configuration.
    @objc init(backActionConfig: BackActionConfig?)

    @objc init()

}
