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
open class NavigationKit {

    // MARK: - Properties

    private let customNavigation: CustomizedNavigation
    private let navigationController: UINavigationController?

    // MARK: - Initializers

    init(customNavigation: CustomizedNavigation, navigationController: UINavigationController?) {
        self.customNavigation = customNavigation
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func doSetup() {
        navigationController?.navigationBar.barTintColor = customNavigation.barBackgroundColor ?? UIColor.white
        navigationController?.navigationBar.isTranslucent = customNavigation.isBarTranslucent ?? true

        if let usingShadow = customNavigation.isBarUsingShadow, !usingShadow {
            navigationController?.navigationBar.shadowImage = UIImage()
        }

        var titleTextAttributes = navigationController?.navigationBar.titleTextAttributes ?? [:]

        if let titleColor = customNavigation.titleColor {
            titleTextAttributes[NSForegroundColorAttributeName] = titleColor
        }

        if let titleFont = customNavigation.titleFont {
            titleTextAttributes[NSFontAttributeName] = titleFont
        }

        navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
    }

}
