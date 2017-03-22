//
//  NavigationConfig.swift
//  NavKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

/// It holds all required things for a type to specify the requirement of
/// how the navigation bar with all of it's items look like and behave.
@objc public protocol NavigationConfig {

    // MARK: - Optional

    /// Specify this property to determine the navigation bar background color.
    @objc optional var barBackgroundColor: UIColor { get set }

    /// Specify this property to determine whether or not the navigation bar
    /// is translucent. Set the value to true if you want to have such kind like
    /// beautiful transparency effect.
    @objc optional var isBarTranslucent: Bool { get set }

    /// Specify this property to determine whether or not the navigation bar
    /// would use shadow. Set the value to false to remove a *strange*
    /// line at the bottom of navigation bar.
    @objc optional var isBarUsingShadow: Bool { get set }

    /// Specify this property to determine which title color that would be used
    /// at the midst of navigation bar.
    @objc optional var titleColor: UIColor { get set }

    /// Specify this property to determine which title font that would be used
    /// at the midst of navigation bar.
    @objc optional var titleFont: UIFont { get set }

    /// Specify this property to determine the image that would be used as
    /// the back button's image.
    @objc optional var backImage: UIImage { get set }

    /// Specify this property to determine the text that would be used at
    /// the right of the back button's image.
    @objc optional var backText: String { get set }

    /// Specify this property to determine the action that would be called
    /// when the back button is tapped. Note that this closure would only be triggered
    /// if either backImage or backText is implemented.
    @objc optional var backTappedAction: ((Any) -> Void)? { get set }

    /// Specify this property to determine whether or not the screen could be
    /// dragged from left to right to go to the previous screen.
    @objc optional var isNavigationUsingInteractivePopGesture: Bool { get set }

}
