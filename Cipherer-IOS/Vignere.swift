//
//  TabBarController.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/9/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import Foundation
import UIKit

class Vignere: UITabBarController, UITabBarControllerDelegate, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.title = "Vignere"
        var hamburger_icon = UIImage(named: "reveal-icon")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:hamburger_icon, style:.Plain, target:self, action:"toggleSideMenu:")
    }
    
    func toggleSideMenu (sender: AnyObject) {
        toggleSideMenuView()
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        println("Selected view" + viewController.title!)
        return true
    }

}
