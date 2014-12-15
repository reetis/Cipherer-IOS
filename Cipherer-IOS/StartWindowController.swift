//
//  StarWindowController.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/9/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import Foundation
import UIKit

class StartWindowController: UIViewController {
    @IBAction func toggleSideMenu (sender: AnyObject) {
        toggleSideMenuView()
    }
}


extension Character {
    func utf8Value() -> UInt8 {
        for s in String(self).utf8 {
            return s
        }
        return 0
    }
    
    func utf16Value() -> UInt16 {
        for s in String(self).utf16 {
            return s
        }
        return 0
    }
    
    func unicodeValue() -> UInt32 {
        for s in String(self).unicodeScalars {
            return s.value
        }
        return 0
    }
}