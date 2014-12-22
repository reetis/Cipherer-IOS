//
//  ROT.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/15/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import Foundation
import UIKit

class ROT: UITabBarController, UITabBarControllerDelegate, UITextViewDelegate {
    
    var lastController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.title = "ROT"
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
        if viewController.title == "ROT Text" {             //Decode
            var rotCipher: ROTCipher = lastController as ROTCipher
            var rotText: ROTText = viewController as ROTText
            
            rotText.keyTextField.text = rotCipher.keyTextField.text
            rotText.outputTextView.text = decodeROT(rotCipher.outputTextView.text, key: rotCipher.keyTextField.text.toInt()!)
        } else if viewController.title == "ROT Code" {      //Encode
            var rotCipher: ROTCipher = viewController as ROTCipher
            var rotText: ROTText = lastController as ROTText
            
            rotCipher.keyTextField.text = rotText.keyTextField.text
            rotCipher.outputTextView.text = encodeROT(rotText.outputTextView.text, key: rotText.keyTextField.text.toInt()!)
        }
        lastController = viewController
        return true
    }
    
    func encodeROT(text: String, key: Int) -> String {
        var encodedText: String = ""
        
        if (key <= 0 || text.isEmpty){
            encodedText = text
        } else {
            var sInd: String.Index = text.startIndex
            for index in 1...countElements(text) {
                var c = text[sInd]
                var num = c.utf8Value()
                
                if (c >= "a" && c <= "z") {
                    c = Character(UnicodeScalar( (num - 97 + key) % 26 + 97 ))
                } else if (c >= "A" && c <= "Z") {
                    c = Character(UnicodeScalar( (num - 65 + key) % 26 + 65 ))
                }
                encodedText += String(c)
                
                sInd = sInd.successor()
            }
        }
        
        return encodedText
    }
    
    func decodeROT(text: String, key: Int) -> String {
        var decodedText: String = ""
        
        if (key <= 0 || text.isEmpty){
            decodedText = text
        } else {
            var sInd: String.Index = text.startIndex
            for index in 1...countElements(text) {
                var c = text[sInd]
                var num = c.utf8Value()
                
                if (c >= "a" && c <= "z") {
                    c = Character(UnicodeScalar( (num - 71 - key % 26) % 26 + 97 ))
                } else if (c >= "A" && c <= "Z") {
                    c = Character(UnicodeScalar( (num - 39 - key % 26) % 26 + 65 ))
                }
                decodedText += String(c)
                
                sInd = sInd.successor()
            }
        }
        
        return decodedText
    }
    
}