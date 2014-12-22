//
//  ASCII.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/22/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import Foundation
import UIKit

class ASCII: UITabBarController, UITabBarControllerDelegate, UITextViewDelegate {
    
    var lastController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.title = "ASCII"
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
        if viewController.title == "ASCII Text" {             //Decode
            var asciiCipher: ASCIICipher = lastController as ASCIICipher
            var asciiText: ASCIIText = viewController as ASCIIText
            
            asciiText.outputTextView.text = decodeASCII(asciiCipher.outputTextView.text)
        } else if viewController.title == "ASCII Code" {      //Encode
            var asciiCipher: ASCIICipher = viewController as ASCIICipher
            var asciiText: ASCIIText = lastController as ASCIIText
            
            asciiCipher.outputTextView.text = encodeASCII(asciiText.outputTextView.text)
        }
        lastController = viewController
        return true
    }
    
    func encodeASCII(text: String) -> String {
        var encodedText: String = ""
        
        text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        for char in text {
            encodedText += "\(char.unicodeValue()) "
        }
        
        return encodedText
    }
    
    func decodeASCII(text: String) -> String {
        var decodedText: String = ""
        
        var asciiNumbers = text.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        for charNum in asciiNumbers {
            var number = charNum.toInt();
            if number != nil {
                decodedText += String(UnicodeScalar(number!))
            } else {
                println("Unknown ASCII number " + charNum)
            }
        }
        
        return decodedText
    }
    
}


