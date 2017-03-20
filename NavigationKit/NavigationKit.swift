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

    /// It stores a type that conforms to NavigationConfig protocol
    /// that would be used to setup how the navigation bar looks like.
    open var navigationConfig: NavigationConfig

    private let navigationController: UINavigationController

    // MARK: - Initializers

    public init(navigationConfig: NavigationConfig, navigationController: UINavigationController) {
        self.navigationConfig = navigationConfig
        self.navigationController = navigationController
    }

    // MARK: - Methods

    /// Setting up navigation config with it's back button if any.
    open func doSetup() {
        doNavigationSetup()
        doBackSetup()
    }

    private func doNavigationSetup() {
        navigationController.navigationBar.barTintColor = navigationConfig.barBackgroundColor ?? UIColor.white
        navigationController.navigationBar.isTranslucent = navigationConfig.isBarTranslucent ?? true

        if let usingShadow = navigationConfig.isBarUsingShadow, !usingShadow {
            navigationController.navigationBar.shadowImage = UIImage()
        }

        var titleTextAttributes = navigationController.navigationBar.titleTextAttributes ?? [:]

        if let titleColor = navigationConfig.titleColor {
            titleTextAttributes[NSForegroundColorAttributeName] = titleColor
        }

        if let titleFont = navigationConfig.titleFont {
            titleTextAttributes[NSFontAttributeName] = titleFont
        }

        navigationController.navigationBar.titleTextAttributes = titleTextAttributes
    }

    private func doBackSetup() {
        if let backConfig = navigationConfig.backConfig {
            let navigationItem = navigationController.navigationItem
            navigationItem.leftBarButtonItems = []

            if let backImage = backConfig.backImage {
                let imageButton = UIButton()
                imageButton.setImage(backImage, for: .normal)
                imageButton.addTarget(self, action: #selector(backTappedAction(sender:)), for: .touchUpInside)

                let imageBarButtonItem = UIBarButtonItem(customView: imageButton)
                navigationItem.leftBarButtonItems!.append(imageBarButtonItem)
            }

            if let backText = backConfig.backText {
                let textButton = UIButton()
                textButton.setTitle(backText, for: .normal)
                textButton.addTarget(self, action: #selector(backTappedAction(sender:)), for: .touchUpInside)

                let textBarButtonItem = UIBarButtonItem(customView: textButton)
                navigationItem.leftBarButtonItems!.append(textBarButtonItem)
            }

            if backConfig.backActionConfig == nil {
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
        if let backActionConfig = navigationConfig.backConfig?.backActionConfig {
            backActionConfig.backTappedAction(sender: sender)
        } else {
            _ = navigationController.popViewController(animated: false)
        }
    }

}
