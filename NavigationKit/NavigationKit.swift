//
//  NavigationKit.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

/// A class that will do configuration stuffs on navigation bar
/// via CustomizedNavigation protocol.
open class NavigationKit: NSObject, UIGestureRecognizerDelegate {

    // MARK: - Properties

    /// It stores a type that conforms to CustomizedNavigation protocol
    /// that would be used to setup how the navigation bar looks like.
    open var customNavigation: CustomizedNavigation?

    /// It stores a type that conforms to CustomizedBackNavigation protocol
    /// that would be used to setup how the back button on navigation bar looks like.
    open var customBackNavigation: CustomizedBackNavigation?

    /// It stores a type that conforms to CustomizedBackAction protocol
    /// that would be used to setup custom action of back button.
    open var customBackAction: CustomizedBackAction?

    private let navigationController: UINavigationController

    // MARK: - Initializers

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    /// Setting up custom navigation with it's back button if any.
    open func doSetup() {
        doCustomNavigationSetup()
        doCustomBackNavigationSetup()
    }

    private func doCustomNavigationSetup() {
        if let customNavigation = customNavigation {
            navigationController.navigationBar.barTintColor = customNavigation.barBackgroundColor ?? UIColor.white
            navigationController.navigationBar.isTranslucent = customNavigation.isBarTranslucent ?? true

            if let usingShadow = customNavigation.isBarUsingShadow, !usingShadow {
                navigationController.navigationBar.shadowImage = UIImage()
            }

            var titleTextAttributes = navigationController.navigationBar.titleTextAttributes ?? [:]

            if let titleColor = customNavigation.titleColor {
                titleTextAttributes[NSForegroundColorAttributeName] = titleColor
            }

            if let titleFont = customNavigation.titleFont {
                titleTextAttributes[NSFontAttributeName] = titleFont
            }
            
            navigationController.navigationBar.titleTextAttributes = titleTextAttributes
        }
    }

    private func doCustomBackNavigationSetup() {
        if let customBackNavigation = customBackNavigation {
            let navigationItem = navigationController.navigationItem
            navigationItem.leftBarButtonItems = []

            if let backImage = customBackNavigation.backImage {
                let imageButton = UIButton()
                imageButton.setImage(backImage, for: .normal)
                imageButton.addTarget(self, action: #selector(backTappedAction(sender:)), for: .touchUpInside)

                let imageBarButtonItem = UIBarButtonItem(customView: imageButton)
                navigationItem.leftBarButtonItems!.append(imageBarButtonItem)
            }

            if let backText = customBackNavigation.backText {
                let textButton = UIButton()
                textButton.setTitle(backText, for: .normal)
                textButton.addTarget(self, action: #selector(backTappedAction(sender:)), for: .touchUpInside)

                let textBarButtonItem = UIBarButtonItem(customView: textButton)
                navigationItem.leftBarButtonItems!.append(textBarButtonItem)
            }

            if customBackAction == nil {
                navigationController.interactivePopGestureRecognizer?.isEnabled = true
                navigationController.interactivePopGestureRecognizer?.delegate = self
            }
        }
    }

    // MARK: - Gesture Recognizer Delegates

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    // MARK: - Actions

    func backTappedAction(sender: Any) {
        if let customBackAction = customBackAction {
            customBackAction.customizedBackTapped(sender: sender)
        } else {
            _ = navigationController.popViewController(animated: false)
        }
    }

}
