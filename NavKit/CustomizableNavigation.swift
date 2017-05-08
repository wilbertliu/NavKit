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
    /// would use shadow. Set the value to false to remove a *strange*
    /// line at the bottom of navigation bar.
    var isBarUsingBottomShadow: Bool { get }

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

    /// Specify this property to determine whether or not the screen could be
    /// dragged from left to right to go to the previous screen.
    var isUsingInteractivePopGesture: Bool { get }

    /// Update the navigation configuration based on the specified properties.
    func updateNavigation()

    /// Reset the navigation configuration.
    func resetNavigation()
}

public extension CustomizableNavigation where Self: UIViewController, Self: UIGestureRecognizerDelegate {
    var barBackgroundColor: UIColor { return .white }
    var isBarUsingBottomShadow: Bool { return true }
    var titleColor: UIColor { return .black }
    var titleFont: UIFont { return .systemFont(ofSize: 17) }
    var backImage: UIImage? { return nil }
    var backText: String? { return nil }
    var isUsingInteractivePopGesture: Bool { return true }

    func updateNavigation() {
        let navigationBar = navigationController?.navigationBar

        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = isBarUsingBottomShadow ? nil : UIImage()

        var barView = navigationBar?.subviews.first?.subviews.first

        if barView == nil || barView != nil && type(of: barView!) != UIView.self {
            barView = UIView(frame: CGRect.zero)

            if let navBarSize = navigationBar?.frame.size {
                let statusBarSize = UIApplication.shared.statusBarFrame.size
                barView?.frame.size = CGSize(width: navBarSize.width, height: navBarSize.height + statusBarSize.height)
            }

            navigationBar?.subviews.first?.insertSubview(barView!, at: 0)
        }

        barView?.backgroundColor = barBackgroundColor

        var titleTextAttributes = navigationBar?.titleTextAttributes ?? [:]

        titleTextAttributes[NSForegroundColorAttributeName] = titleColor
        titleTextAttributes[NSFontAttributeName] = titleFont

        navigationBar?.titleTextAttributes = titleTextAttributes

        navigationItem.leftBarButtonItems = []

        if let backImage = backImage {
            let imageButtonFrame = CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height)
            let imageButton = UIButton(frame: imageButtonFrame)
            imageButton.setImage(backImage, for: .normal)
            imageButton.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)

            let imageBarButtonItem = UIBarButtonItem(customView: imageButton)
            navigationItem.leftBarButtonItems?.append(imageBarButtonItem)
        }

        if let backText = backText {
            let textBarButtonItem = UIBarButtonItem(title: backText,
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(backTapped(_:)))
            navigationItem.leftBarButtonItems?.append(textBarButtonItem)
        }

        let interactivePopRecognizer = navigationController?.interactivePopGestureRecognizer
        interactivePopRecognizer?.isEnabled = isUsingInteractivePopGesture
        interactivePopRecognizer?.delegate = self
    }

    func resetNavigation() {
        let navigationBar = navigationController?.navigationBar

        navigationBar?.subviews.first?.subviews.first?.removeFromSuperview()
        navigationBar?.setBackgroundImage(nil, for: .default)
        navigationBar?.shadowImage = nil
        navigationBar?.titleTextAttributes = nil
    }
}

public extension UIViewController {
    /// Action that will be executed when the navigation bar has back button and it's tapped.
    ///
    /// - Parameter sender: The sender of action.
    func backTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
