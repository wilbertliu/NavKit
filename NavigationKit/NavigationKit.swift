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

    private let customNavigation: CustomizedNavigation?
    private let customBackNavigation: CustomizedBackNavigation?
    private let customBackAction: CustomizedBackAction?
    private let navigationController: UINavigationController?

    // MARK: - Initializers

    init(customNavigation: CustomizedNavigation? = nil,
         customBackNavigation: CustomizedBackNavigation? = nil,
         customBackAction: CustomizedBackAction? = nil,
         navigationController: UINavigationController? = nil) {
        self.customNavigation = customNavigation
        self.customBackNavigation = customBackNavigation
        self.customBackAction = customBackAction
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func doSetup() {
        doCustomNavigationSetup()
        doCustomBackNavigationSetup()
    }

    private func doCustomNavigationSetup() {
        if let customNavigation = customNavigation, let navigationController = navigationController {
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
        if let customBackNavigation = customBackNavigation, let navigationController = navigationController {
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

    @objc private func backTappedAction(sender: Any) {
        if let customBackAction = customBackAction {
            customBackAction.customizedBackTapped(sender: sender)
        } else if let navigationController = navigationController {
            _ = navigationController.popViewController(animated: true)
        }
    }

}
