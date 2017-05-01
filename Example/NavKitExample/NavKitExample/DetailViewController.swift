//
//  DetailViewController.swift
//  NavKitExample
//
//  Created by Wilbert Liu on 5/1/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import UIKit
import NavKit

class DetailViewController: UIViewController, CustomizableNavigation, UIGestureRecognizerDelegate {
    // MARK: - Navigation Config

    var barBackgroundColor: UIColor = UIColor.blue.withAlphaComponent(0.5)
    var backText: String? = "<-- Go back"

    // MARK: - Life Cycles

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
        self.updateNavigation()
    }
}
