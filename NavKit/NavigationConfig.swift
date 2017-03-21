//
//  NavigationConfig.swift
//  NavKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

/// It holds all required things for a type to specify the requirement of
/// how the navigation bar with all of it's items look like.
@objc public protocol NavigationConfig {

    // MARK: - Optional

    /// Specify this property to determine the navigation bar background color.
    @objc optional var barBackgroundColor: UIColor { get }

    /// Specify this property to determine whether or not the navigation bar
    /// is translucent. Set the value to true if you want to have such kind like
    /// beautiful transparency effect.
    @objc optional var isBarTranslucent: Bool { get }

    /// Specify this property to determine whether or not the navigation bar
    /// would use shadow. Set the value to false to remove a *strange*
    /// line at the bottom of navigation bar.
    @objc optional var isBarUsingShadow: Bool { get }

    /// Specify this property to determine which title color that would be used
    /// at the midst of navigation bar.
    @objc optional var titleColor: UIColor { get }

    /// Specify this property to determine which title font that would be used
    /// at the midst of navigation bar.
    @objc optional var titleFont: UIFont { get }

}
