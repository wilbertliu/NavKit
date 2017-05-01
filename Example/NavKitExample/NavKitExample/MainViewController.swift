//
//  MainViewController.swift
//  NavKitExample
//
//  Created by Wilbert Liu on 5/1/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import UIKit
import NavKit

class MainViewController: UIViewController, CustomizableNavigation, UIGestureRecognizerDelegate {
    // MARK: - Properties

    var barAlpha: CGFloat = 1
    var alphaDirection: Int = 0
    var timer: Timer!

    // MARK: - Navigation Config

    var barBackgroundColor: UIColor = .magenta

    // MARK: - Life Cycles

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(timerEventOccured(_:)),
                                     userInfo: nil,
                                     repeats: true)

        self.updateNavigation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }

    // MARK: - Actions

    func timerEventOccured(_ sender: Any) {
        if alphaDirection == 0 {
            barAlpha -= 0.1
        } else {
            barAlpha += 0.1
        }

        if barAlpha <= 0 {
            alphaDirection = 1
            barAlpha = 0
        } else if barAlpha >= 1 {
            alphaDirection = 0
            barAlpha = 1
        }

        barBackgroundColor = barBackgroundColor.withAlphaComponent(barAlpha)
        self.updateNavigation()
    }
}
