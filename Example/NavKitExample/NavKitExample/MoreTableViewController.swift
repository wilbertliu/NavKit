//
//  MoreTableViewController.swift
//  NavKitExample
//
//  Created by Wilbert Liu on 5/1/17.
//  Copyright © 2017 Wilbert Liu. All rights reserved.
//

import UIKit
import NavKit

class MoreTableViewController: UITableViewController, CustomizableNavigation, UIGestureRecognizerDelegate {
    // MARK: - Navigation Config

    var barBackgroundColor: UIColor = UIColor.cyan.withAlphaComponent(0)
    var backText: String? = "<-- Go back"

    // MARK: - Life Cycles

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateNavigation()
    }

    // MARK: - Table View Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath)

        cell.textLabel?.text = "\(indexPath.row + 1)"

        return cell
    }

    // MARK: - Scroll View Delegate

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var barAlpha = scrollView.contentOffset.y * 0.002
        barAlpha = min(barAlpha, 1)
        barBackgroundColor = barBackgroundColor.withAlphaComponent(barAlpha)
        self.updateNavigation()
    }
}
