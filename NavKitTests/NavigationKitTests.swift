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
        let navigationKit = NavigationKit(
            navigationConfig: Navigation1(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        XCTAssertEqual(navigationController.navigationBar.barTintColor, UIColor.black)
    }

    func testBarTranslucency() {
        let navigationKit = NavigationKit(
            navigationConfig: Navigation2(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        XCTAssertFalse(navigationController.navigationBar.isTranslucent)
    }

    func testBarShadow() {
        let navigationKit = NavigationKit(
            navigationConfig: Navigation3(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        XCTAssertNotNil(navigationController.navigationBar.shadowImage)
    }

    func testTitleColor() {
        let navigationKit = NavigationKit(
            navigationConfig: Navigation4(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleColor = titleTextAttributes?[NSForegroundColorAttributeName] as! UIColor

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleColor, UIColor.white)
    }

    func testTitleFont() {
        let navigationKit = NavigationKit(
            navigationConfig: Navigation5(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleFont = titleTextAttributes?[NSFontAttributeName] as! UIFont

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleFont, UIFont.systemFont(ofSize: 20))
    }

    func testBackImage() {
        let navigationKit = NavigationKit(
            navigationConfig: Navigation6(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)
    }

    func testBackImageWithText() {
        let navigationKit = NavigationKit(
            navigationConfig: Navigation7(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        let textButton = navigationItem.leftBarButtonItems!.last!.title
        XCTAssertEqual(textButton, "Back")
    }

    func testBackAction() {
        let navigationKit = NavigationKit(
            navigationConfig: Navigation7(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

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
            navigationConfig: navigation,
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

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
        let navigationKit = NavigationKit(
            navigationConfig: Navigation6(),
            navigationController: navigationController,
            navigationItem: navigationItem
        )

        navigationKit.doSetup()

        XCTAssertTrue(navigationKit.gestureRecognizerShouldBegin(UIGestureRecognizer()))
    }

}
