//
//  BackActionConfig.swift
//  NavKit
//
//  Created by Wilbert Liu on 3/19/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import Foundation

/// It holds all required things for a type to specify the requirement of
/// how the back button custom action would be doing.
@objc public protocol BackActionConfig {

    // MARK: - Required

    /// A function that would be called when the back button has tapped.
    /// It used to determine the custom behaviour that navigation must be doing
    /// rather than just go back to the previous screen.
    ///
    /// - Parameter sender: The sender of this event, most likely would be a button.
    func backTappedAction(sender: Any)

}
