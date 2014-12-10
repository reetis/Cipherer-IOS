//
//  VignereCipher.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/10/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import UIKit

class VignereCipher: NSObject, UITabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        println("Selected view" + viewController.title!)
        return true
    }
}