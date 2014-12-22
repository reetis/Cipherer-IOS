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
    
    var lastController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.title = "Vignere"
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
        if viewController.title == "Vignere Text" {             //Decode
            var vignereCipher: VignereCipher = lastController as VignereCipher
            var vignereText: VignereText = viewController as VignereText
            
            vignereText.keyTextField.text = vignereCipher.keyTextField.text
            vignereText.outputTextView.text = decodeVignere(vignereCipher.outputTextView.text, key: vignereCipher.keyTextField.text)
        } else if viewController.title == "Vignere Code" {      //Encode
            var vignereCipher: VignereCipher = viewController as VignereCipher
            var vignereText: VignereText = lastController as VignereText
            
            vignereCipher.keyTextField.text = vignereText.keyTextField.text
            vignereCipher.outputTextView.text = encodeVignere(vignereText.outputTextView.text, key: vignereText.keyTextField.text)
        }
        lastController = viewController
        return true
    }
    
    func encodeVignere(text: String, key: String) -> String {
        var encodedText: String = ""
        
        if (key.isEmpty || text.isEmpty){
            encodedText = text
        } else {
            var keyLow = key.lowercaseString
            var keyPrepd: [Int] = []
            
            for c in keyLow {
                if (c >= "a" && c <= "z") {
                    keyPrepd.append(c.utf8Value() - 97)
                } else {
                    keyPrepd.append(0)
                }
            }
            
            var sInd: String.Index = text.startIndex
            for index in 1...countElements(text) {
                var c = text[sInd]
                var num = c.utf8Value()
                
                if (c >= "a" && c <= "z") {
                    c = Character(UnicodeScalar( (num - 97 + keyPrepd[index % keyPrepd.count]) % 26 + 97 ))
                } else if (c >= "A" && c <= "Z") {
                    c = Character(UnicodeScalar( (num - 65 + keyPrepd[index % keyPrepd.count]) % 26 + 65 ))
                }
                encodedText += String(c)
                
                sInd = sInd.successor()
            }
        }
        
        return encodedText
    }
    
    func decodeVignere(text: String, key: String) -> String {
        var decodedText: String = ""
        
        if (key.isEmpty || text.isEmpty){
            decodedText = text
        } else {
            var keyLow = key.lowercaseString
            var keyPrepd: [Int] = []
            
            for c in keyLow {
                if (c >= "a" && c <= "z") {
                    keyPrepd.append(c.utf8Value() - 97)
                } else {
                    keyPrepd.append(0)
                }
            }
            
            var sInd: String.Index = text.startIndex
            for index in 1...countElements(text) {
                var c = text[sInd]
                var num = c.utf8Value()
                
                if (c >= "a" && c <= "z") {
                    c = Character(UnicodeScalar( (num - 97 + 26 - keyPrepd[index % keyPrepd.count]) % 26 + 97 ))
                } else if (c >= "A" && c <= "Z") {
                    c = Character(UnicodeScalar( (num - 65 + 26 - keyPrepd[index % keyPrepd.count]) % 26 + 65 ))
                }
                decodedText += String(c)
                
                sInd = sInd.successor()
            }
        }
        
        return decodedText
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

