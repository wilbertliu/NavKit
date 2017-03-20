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
        let navigation1: Navigation1 = Navigation1()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation1, navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertEqual(navigationController.navigationBar.barTintColor, UIColor.black)
    }

    func testBarTranslucency() {
        let navigation2: Navigation2 = Navigation2()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation2, navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertFalse(navigationController.navigationBar.isTranslucent)
    }

    func testBarShadow() {
        let navigation3: Navigation3 = Navigation3()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation3, navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertNotNil(navigationController.navigationBar.shadowImage)
    }

    func testTitleColor() {
        let navigation4: Navigation4 = Navigation4()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation4, navigationController: navigationController)

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleColor = titleTextAttributes?[NSForegroundColorAttributeName] as! UIColor

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleColor, UIColor.white)
    }

    func testTitleFont() {
        let navigation5: Navigation5 = Navigation5()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation5, navigationController: navigationController)

        navigationKit.doSetup()

        let titleTextAttributes = navigationController.navigationBar.titleTextAttributes
        let titleFont = titleTextAttributes?[NSFontAttributeName] as! UIFont

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleFont, UIFont.systemFont(ofSize: 20))
    }

    func testBackImage() {
        let backNavigation1: BackNavigation1 = BackNavigation1()
        let navigationKit: NavigationKit = NavigationKit(customBackNavigation: backNavigation1, navigationController: navigationController)

        navigationKit.doSetup()

        let navigationItem = navigationController.navigationItem
        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)
    }

    func testBackImageWithText() {
        let backNavigation2: BackNavigation2 = BackNavigation2()
        let navigationKit: NavigationKit = NavigationKit(customBackNavigation: backNavigation2, navigationController: navigationController)

        navigationKit.doSetup()

        let navigationItem = navigationController.navigationItem
        XCTAssertEqual(navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        let textButton = navigationItem.leftBarButtonItems!.last!.customView as! UIButton
        XCTAssertEqual(textButton.currentTitle, "Back")
    }

    func testBackAction() {
        let backNavigation1: BackNavigation1 = BackNavigation1()
        let navigationKit: NavigationKit = NavigationKit(customBackNavigation: backNavigation1, navigationController: navigationController)

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
        let backNavigation1: BackNavigation1 = BackNavigation1()
        let backAction: BackAction = BackAction(navigationController: navigationController)
        let navigationKit: NavigationKit = NavigationKit(customBackNavigation: backNavigation1, customBackAction: backAction, navigationController: navigationController)

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
        let backNavigation1: BackNavigation1 = BackNavigation1()
        let navigationKit: NavigationKit = NavigationKit(customBackNavigation: backNavigation1, navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssertTrue(navigationKit.gestureRecognizerShouldBegin(UIGestureRecognizer()))
    }

}
