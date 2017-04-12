//
//  NavigationKitTests.swift
//  NavKitTests
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import XCTest
@testable import NavKit

class NavigationKitTests: XCTestCase {
    // MARK: - Properties

    var navigationController: UINavigationController!
    var navigationItem: UINavigationItem!

    // MARK: - Life Cycles

    override func setUp() {
        super.setUp()

        navigationController = UINavigationController()
        navigationItem = UINavigationItem()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests

    func testBarBackgroundColor() {
        let navigation = Navigation1()
        let navigationKit = NavigationKit(
            customizableNavigation: navigation,
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        XCTAssertEqual(navigationController.navigationBar.barTintColor, .black)

        navigation.barBackgroundColor = .blue
        navigationKit.updateNavigation()

        XCTAssertEqual(navigationController.navigationBar.barTintColor, .blue)
    }

    func testBarTranslucency() {
        let navigationKit = NavigationKit(
            customizableNavigation: Navigation2(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        XCTAssertFalse(navigationController.navigationBar.isTranslucent)
    }

    func testBarShadow() {
        let navigationKit = NavigationKit(
            customizableNavigation: Navigation3(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        XCTAssertNotNil(navigationController.navigationBar.shadowImage)
    }

    func testTitleColor() {
        let navigationKit = NavigationKit(
            customizableNavigation: Navigation4(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleColor = titleTextAttributes?[NSForegroundColorAttributeName] as! UIColor

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleColor, UIColor.white)
    }

    func testTitleFont() {
        let navigationKit = NavigationKit(
            customizableNavigation: Navigation5(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleFont = titleTextAttributes?[NSFontAttributeName] as! UIFont

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleFont, UIFont.systemFont(ofSize: 20))
    }

    func testBackImage() {
        let navigationKit = NavigationKit(
            customizableNavigation: Navigation6(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)
    }

    func testBackImageWithText() {
        let navigationKit = NavigationKit(
            customizableNavigation: Navigation7(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        let textButton = navigationItem.leftBarButtonItems!.last!.title
        XCTAssertEqual(textButton, "Back")
    }

    func testBackAction() {
        let navigationKit = NavigationKit(
            customizableNavigation: Navigation7(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        navigationController.viewControllers = [
            UIViewController(),
            UIViewController(),
            UIViewController()
        ]

        XCTAssertEqual(navigationController.viewControllers.count, 3)

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        navigationKit.backTapped(sender: imageButton)
        XCTAssertNotEqual(navigationController.viewControllers.count, 1)
    }

    func testCustomBackAction() {
        let navigation = Navigation8()

        navigation.backTappedAction = { [unowned self] sender in
            _ = self.navigationController.popToRootViewController(animated: false)
        }

        let navigationKit = NavigationKit(
            customizableNavigation: navigation,
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        navigationController.viewControllers = [
            UIViewController(),
            UIViewController(),
            UIViewController()
        ]

        XCTAssertEqual(navigationController.viewControllers.count, 3)

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        navigationKit.backTapped(sender: imageButton)
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func testInteractivePopupGestureDelegate() {
        let navigation = Navigation6()
        let navigationKit = NavigationKit(
            customizableNavigation: navigation,
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        XCTAssertTrue(navigationKit.gestureRecognizerShouldBegin(UIGestureRecognizer()))
        XCTAssertFalse(navigation.isNavigationUsingInteractivePopGesture)
    }

    func testClearBarBackground() {
        let navigation = Navigation1()
        navigation.barBackgroundColor = .clear

        let navigationKit = NavigationKit(
            customizableNavigation: navigation,
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.updateNavigation()

        XCTAssertEqual(navigationController.navigationBar.barTintColor, .clear)
        XCTAssertNotNil(navigationController.navigationBar.backgroundImage(for: .default))
    }
}
