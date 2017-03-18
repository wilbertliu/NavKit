//
//  NavigationKit.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

/// A class that holds the reference of configured
/// custom navigation settings via CustomizedNavigation protocol.
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
    }

}
