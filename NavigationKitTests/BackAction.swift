//
//  BackAction.swift
//  NavigationKit
//
//  Created by Wilbert Liu on 3/19/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation
import NavigationKit

class BackAction: BackActionConfig {

    let navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func backTappedAction(sender: Any) {
        _ = navigationController?.popToRootViewController(animated: false)
    }

}
