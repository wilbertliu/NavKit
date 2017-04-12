//
//  CustomizableNavigation.swift
//  NavKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

/// It holds all required things for a type to specify the requirement of
/// how the navigation bar with all of it's items look like and behave.
public protocol CustomizableNavigation {
    /// Specify this property to determine the navigation bar background color.
    var barBackgroundColor: UIColor { get }

    /// Specify this property to determine whether or not the navigation bar
    /// is translucent. Set the value to true if you want to have such kind like
    /// beautiful transparency effect.
    var isBarTranslucent: Bool { get }

    /// Specify this property to determine whether or not the navigation bar
    /// would use shadow. Set the value to false to remove a *strange*
    /// line at the bottom of navigation bar.
    var isBarUsingShadow: Bool { get }

    /// Specify this property to determine which title color that would be used
    /// at the midst of navigation bar.
    var titleColor: UIColor { get }

    /// Specify this property to determine which title font that would be used
    /// at the midst of navigation bar.
    var titleFont: UIFont { get }

    /// Specify this property to determine the image that would be used as
    /// the back button's image.
    var backImage: UIImage? { get }

    /// Specify this property to determine the text that would be used at
    /// the right of the back button's image.
    var backText: String? { get }

    /// Specify this property to determine the action that would be called
    /// when the back button is tapped. Note that this closure would only be triggered
    /// if either backImage or backText is implemented.
    var backTappedAction: ((Any) -> Void)? { get }

    /// Specify this property to determine whether or not the screen could be
    /// dragged from left to right to go to the previous screen.
    var isNavigationUsingInteractivePopGesture: Bool { get }
}

public extension CustomizableNavigation {
    var barBackgroundColor: UIColor { return .white }
    var isBarTranslucent: Bool { return true }
    var isBarUsingShadow: Bool { return true }
    var titleColor: UIColor { return .black }
    var titleFont: UIFont { return UIFont.systemFont(ofSize: 17) }
    var backImage: UIImage? { return nil }
    var backText: String? { return nil }
    var backTappedAction: ((Any) -> Void)? { return nil }
    var isNavigationUsingInteractivePopGesture: Bool { return true }
}
