//
//  Navigation4.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/19/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation
import NavigationKit

class Navigation4: NavigationConfig {

    var backConfig: BackConfig?

    required init() { }

    required init(backConfig: BackConfig?) {
        self.backConfig = backConfig
    }

    var titleColor: UIColor {
        return UIColor.white
    }

}
