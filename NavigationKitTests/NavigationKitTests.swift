//
//  NavigationKitTests.swift
//  NavigationKitTests
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import XCTest
@testable import NavigationKit

class NavigationKitTests: XCTestCase {

    // MARK: - Properties

    var navigationController: UINavigationController!

    // MARK: - Life Cycles

    override func setUp() {
        super.setUp()

        navigationController = UINavigationController()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests

    func testBarBackgroundColor() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation1(), navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertEqual(navigationController.navigationBar.barTintColor, UIColor.black)
    }

    func testBarTranslucency() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation2(), navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertFalse(navigationController.navigationBar.isTranslucent)
    }

    func testBarShadow() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation3(), navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertNotNil(navigationController.navigationBar.shadowImage)
    }

    func testTitleColor() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation4(), navigationController: navigationController)

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleColor = titleTextAttributes?[NSForegroundColorAttributeName] as! UIColor

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleColor, UIColor.white)
    }

    func testTitleFont() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation5(), navigationController: navigationController)

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleFont = titleTextAttributes?[NSFontAttributeName] as! UIFont

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleFont, UIFont.systemFont(ofSize: 20))
    }

    func testBackImage() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation1(backConfig: BackNavigation1()), navigationController: navigationController)

        navigationKit.doSetup()

        let navigationItem = navigationController.navigationItem
        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)
    }

    func testBackImageWithText() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation1(backConfig: BackNavigation2()), navigationController: navigationController)

        navigationKit.doSetup()

        let navigationItem = navigationController.navigationItem
        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        let textButton = navigationItem.leftBarButtonItems!.last!.customView as! UIButton
        XCTAssertEqual(textButton.currentTitle, "Back")
    }

    func testBackAction() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation1(backConfig: BackNavigation1()), navigationController: navigationController)

        navigationKit.doSetup()

        navigationController.viewControllers = [
            UIViewController(),
            UIViewController(),
            UIViewController()
        ]

        XCTAssertEqual(navigationController.viewControllers.count, 3)

        let navigationItem = navigationController.navigationItem
        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        navigationKit.backTappedAction(sender: imageButton)
        XCTAssertNotEqual(navigationController.viewControllers.count, 1)
    }

    func testCustomBackAction() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation1(backConfig: BackNavigation1(backActionConfig: BackAction(navigationController: navigationController))), navigationController: navigationController)

        navigationKit.doSetup()

        navigationController.viewControllers = [
            UIViewController(),
            UIViewController(),
            UIViewController()
        ]

        XCTAssertEqual(navigationController.viewControllers.count, 3)

        let navigationItem = navigationController.navigationItem
        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        navigationKit.backTappedAction(sender: imageButton)
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func testInteractivePopupGestureDelegate() {
        let navigationKit: NavigationKit = NavigationKit(navigationConfig: Navigation1(backConfig: BackNavigation1()), navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertTrue(navigationKit.gestureRecognizerShouldBegin(UIGestureRecognizer()))
    }

}
