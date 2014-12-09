//
//  TabBarController.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/9/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Vignere"
        var hamburger_icon = UIImage(named: "reveal-icon")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:hamburger_icon, style:.Plain, target:self, action:"toggleSideMenu:")
    }
    
    func toggleSideMenu (sender: AnyObject) {
        toggleSideMenuView()
    }
}
