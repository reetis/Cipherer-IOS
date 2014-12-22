//
//  Braille.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/22/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import Foundation
import UIKit

class Braille: UITabBarController, UITabBarControllerDelegate, UITextViewDelegate {
    
    var lastController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.title = "Braille"
        var hamburger_icon = UIImage(named: "reveal-icon")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:hamburger_icon, style:.Plain, target:self, action:"toggleSideMenu:")
    }
    
    override func viewDidAppear(animated: Bool) {
        lastController = self.selectedViewController
    }
    
    func toggleSideMenu (sender: AnyObject) {
        toggleSideMenuView()
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) -> Bool {
        if lastController == viewController {
            return true
        }
        if viewController.title == "Braille Text" {             //Decode
            var brailleCipher: BrailleCipher = lastController as BrailleCipher
            var brailleText: BrailleText = viewController as BrailleText
            
            brailleText.outputTextView.text = decodeBraille(brailleCipher.outputTextView.text)
        } else if viewController.title == "Braille Code" {      //Encode
            var brailleCipher: BrailleCipher = viewController as BrailleCipher
            var brailleText: BrailleText = lastController as BrailleText
            
            brailleCipher.outputTextView.text = encodeBraille(brailleText.outputTextView.text)
        }
        lastController = viewController
        return true
    }
    
    func encodeBraille(text: String) -> String {
        var encodedText: String = "Labas"
        
        
        return encodedText
    }
    
    func decodeBraille(text: String) -> String {
        var decodedText: String = ""
        
        
        return decodedText
    }
    
}


