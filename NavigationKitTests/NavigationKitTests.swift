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

    var navigationController: UINavigationController?

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

        XCTAssert(navigationController?.navigationBar.barTintColor == UIColor.black)
    }

    func testBarTranslucency() {
        let navigation2: Navigation2 = Navigation2()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation2, navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssert(navigationController?.navigationBar.isTranslucent == false)
    }

    func testBarShadow() {
        let navigation3: Navigation3 = Navigation3()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation3, navigationController: navigationController)

        navigationKit.doSetup()

        XCTAssert(navigationController?.navigationBar.shadowImage != nil)
    }

    func testTitleColor() {
        let navigation4: Navigation4 = Navigation4()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation4, navigationController: navigationController)

        navigationKit.doSetup()

        let titleTextAttributes = navigationController?.navigationBar.titleTextAttributes
        let titleColor = titleTextAttributes?[NSForegroundColorAttributeName] as! UIColor

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleColor, UIColor.white)
    }

    func testTitleFont() {
        let navigation5: Navigation5 = Navigation5()
        let navigationKit: NavigationKit = NavigationKit(customNavigation: navigation5, navigationController: navigationController)

        navigationKit.doSetup()

        let titleTextAttributes = navigationController?.navigationBar.titleTextAttributes
        let titleFont = titleTextAttributes?[NSFontAttributeName] as! UIFont

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleFont, UIFont.systemFont(ofSize: 20))
    }

}
