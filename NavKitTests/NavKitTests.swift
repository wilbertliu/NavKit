//
//  NavKitTests.swift
//  NavKitTests
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import XCTest
@testable import NavKit

class NavKitTests: XCTestCase {
    // MARK: - Properties

    var controller: ViewController!
    var navController: UINavigationController!

    // MARK: - Life Cycles

    override func setUp() {
        super.setUp()

        controller = ViewController()
        navController = UINavigationController(rootViewController: controller)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests

    func testBarBackgroundColor() {
        controller.updateNavigation()
        XCTAssertNotNil(navController.navigationBar.backgroundImage(for: .default))

        controller.barBackgroundColor = UIColor.white.withAlphaComponent(0.5)
        controller.updateNavigation()
        XCTAssertEqual(controller.barBackgroundColor, navController.navigationBar.subviews.first?.subviews.first?.backgroundColor)
    }
    
    func testBarShadow() {
        controller.updateNavigation()
        XCTAssertNil(navController.navigationBar.shadowImage)

        controller.isBarUsingBottomShadow = false
        controller.updateNavigation()
        XCTAssertNotNil(navController.navigationBar.shadowImage)
    }

    func testTitleColor() {
        controller.updateNavigation()

        let titleTextAttributes = navController.navigationBar.titleTextAttributes
        let titleColor = titleTextAttributes?[NSForegroundColorAttributeName] as! UIColor

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleColor, .black)
    }

    func testTitleFont() {
        controller.updateNavigation()

        let titleTextAttributes = navController.navigationBar.titleTextAttributes
        let titleFont = titleTextAttributes?[NSFontAttributeName] as! UIFont

        XCTAssertNotNil(titleTextAttributes)
        XCTAssertEqual(titleFont, .systemFont(ofSize: 17))
    }

    func testBackImage() {
        controller.backImage = UIImage()
        controller.updateNavigation()
        XCTAssertEqual(controller.navigationItem.leftBarButtonItems!.count, 1)

        let imageButton = controller.navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)
    }

    func testBackImageWithText() {
        controller.backImage = UIImage()
        controller.backText = "Back"
        controller.updateNavigation()

        XCTAssertEqual(controller.navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = controller.navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        let title = controller.navigationItem.leftBarButtonItems!.last!.title
        XCTAssertEqual(title, controller.backText)
    }

    func testBackAction() {
        let lastController = ViewController()
        lastController.backImage = UIImage()
        lastController.backText = "Back"
        lastController.updateNavigation()

        navController.pushViewController(UIViewController(), animated: false)
        navController.pushViewController(lastController, animated: false)

        XCTAssertEqual(navController.viewControllers.count, 3)
        XCTAssertEqual(lastController.navigationItem.leftBarButtonItems!.count, 2)

        let imageButton = lastController.navigationItem.leftBarButtonItems!.first!.customView as! UIButton
        XCTAssertNotNil(imageButton.currentImage)

        imageButton.sendActions(for: .touchUpInside)
        XCTAssertNotEqual(navController.viewControllers.count, 2)
    }

    func testInteractivePopupGestureDelegate() {
        controller.updateNavigation()
        XCTAssertTrue(controller.isUsingInteractivePopGesture)
    }
}
