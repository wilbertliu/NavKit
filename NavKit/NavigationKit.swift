//
//  NavigationKit.swift
//  NavKit
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
    /// that would be used to setup how the navigation bar looks like and behave.
    open let navigationConfig: NavigationConfig

    private let navigationController: UINavigationController
    private let navigationItem: UINavigationItem

    // MARK: - Initializers

    public init(navigationConfig: NavigationConfig, navigationController: UINavigationController, navigationItem: UINavigationItem) {
        self.navigationConfig = navigationConfig
        self.navigationController = navigationController
        self.navigationItem = navigationItem
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
        navigationItem.leftBarButtonItems = []

        if let backImage = navigationConfig.backImage {
            let imageButtonFrame = CGRect(x: 0, y: 0, width: backImage.size.width, height: backImage.size.height)
            let imageButton = UIButton(frame: imageButtonFrame)
            imageButton.setImage(backImage, for: .normal)
            imageButton.addTarget(self, action: #selector(backTapped(sender:)), for: .touchUpInside)

            let imageBarButtonItem = UIBarButtonItem(customView: imageButton)
            navigationItem.leftBarButtonItems!.append(imageBarButtonItem)
        }

        if let backText = navigationConfig.backText {
            let textBarButtonItem = UIBarButtonItem(title: backText, style: .plain, target: self, action: #selector(backTapped(sender:)))
            navigationItem.leftBarButtonItems!.append(textBarButtonItem)
        }

        navigationController.interactivePopGestureRecognizer?.isEnabled = navigationConfig.isNavigationUsingInteractivePopGesture ?? true
        navigationController.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: - Gesture Recognizer Delegates

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    // MARK: - Actions

    func backTapped(sender: Any) {
        if let backTappedAction = navigationConfig.backTappedAction ?? nil {
            backTappedAction(sender)
        } else {
            _ = navigationController.popViewController(animated: true)
        }
    }

}
