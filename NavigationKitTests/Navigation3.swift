//
//  Navigation3.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/18/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation
import NavigationKit

class Navigation3: NavigationConfig {

    var backConfig: BackConfig?

    required init() { }

    required init(backConfig: BackConfig?) {
        self.backConfig = backConfig
    }

    var isBarUsingShadow: Bool {
        return false
    }

}
