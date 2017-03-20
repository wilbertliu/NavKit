//
//  BackNavigation2.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/19/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation
import NavigationKit

class BackNavigation2: BackConfig {

    var backActionConfig: BackActionConfig?

    required init() { }

    required init(backActionConfig: BackActionConfig?) {
        self.backActionConfig = backActionConfig
    }

    var backImage: UIImage {
        return UIImage()
    }

    var backText: String {
        return "Back"
    }
    
}
