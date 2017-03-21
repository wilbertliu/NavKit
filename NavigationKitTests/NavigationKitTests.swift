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
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation1()

        navigationKit.doSetup()

        XCTAssertEqual(navigationController.navigationBar.barTintColor, UIColor.black)
    }

    func testBarTranslucency() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation2()

        navigationKit.doSetup()

        XCTAssertFalse(navigationController.navigationBar.isTranslucent)
    }

    func testBarShadow() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation3()

        navigationKit.doSetup()

        XCTAssertNotNil(navigationController.navigationBar.shadowImage)
    }

    func testTitleColor() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation4()

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleColor = titleTextAttributes?[NSForegroundColorAttributeName] as! UIColor

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleColor, UIColor.white)
    }

    func testTitleFont() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation5()

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleFont = titleTextAttributes?[NSFontAttributeName] as! UIFont

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleFont, UIFont.systemFont(ofSize: 20))
    }

    func testBackImage() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation1()
        navigationKit.backConfig = BackNavigation1()

        navigationKit.doSetup()

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)
    }

    func testBackImageWithText() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation1()
        navigationKit.backConfig = BackNavigation2()

        navigationKit.doSetup()

        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        let textButton = navigationItem.leftBarButtonItems!.last!.title
        XCTAssertEqual(textButton, "Back")
    }

    func testBackAction() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation1()
        navigationKit.backConfig = BackNavigation1()

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

        navigationKit.backTappedAction(sender: imageButton)
        XCTAssertNotEqual(navigationController.viewControllers.count, 1)
    }

    func testCustomBackAction() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation1()
        navigationKit.backConfig = BackNavigation1()
        navigationKit.backActionConfig = BackAction(navigationController: navigationController)

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

        navigationKit.backTappedAction(sender: imageButton)
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func testInteractivePopupGestureDelegate() {
        let navigationKit = NavigationKit(navigationController: navigationController, navigationItem: navigationItem)
        navigationKit.navigationConfig = Navigation1()
        navigationKit.backConfig = BackNavigation1()

        navigationKit.doSetup()

        XCTAssertTrue(navigationKit.gestureRecognizerShouldBegin(UIGestureRecognizer()))
    }

}
