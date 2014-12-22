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
        var encodedText: String = ""
        
        for char in text {
            var charNum: Int = 0
            var appendChar: String = "";
            if char.utf8Value() >= 48 && char.utf8Value() <= 57 {
                encodedText += String(UnicodeScalar(10240 + 0b111100))
            }
            if char.utf8Value() >= 65 && char.utf8Value() <= 90 {
                encodedText += String(UnicodeScalar(10240 + 0b100000))
            }
            switch (String(char).lowercaseString) {
            case "a", "1":
                charNum = 0b1;
            case "b", "2":
                charNum = 0b11;
            case "c", "3":
                charNum = 0b1001;
            case "d", "4":
                charNum = 0b11001;
            case "e", "5":
                charNum = 0b10001;
            case "f", "6":
                charNum = 0b1011;
            case "g", "7":
                charNum = 0b11011;
            case "h", "8":
                charNum = 0b10011;
            case "i", "9":
                charNum = 0b1010;
            case "j", "0":
                charNum = 0b11010;
            case "k":
                charNum = 0b101;
            case "l":
                charNum = 0b111;
            case "m":
                charNum = 0b1101;
            case "n":
                charNum = 0b11101;
            case "o":
                charNum = 0b10101;
            case "p":
                charNum = 0b1111;
            case "q":
                charNum = 0b11111;
            case "r":
                charNum = 0b10111;
            case "s":
                charNum = 0b1110;
            case "t":
                charNum = 0b11110;
            case "u":
                charNum = 0b100101;
            case "v":
                charNum = 0b100111;
            case "w":
                charNum = 0b111010;
            case "x":
                charNum = 0b101101;
            case "y":
                charNum = 0b111101;
            case "z":
                charNum = 0b110101;
            case "!":
                charNum = 0b10110;
            case "\"":
                charNum = 0b100;
            case ",":
                charNum = 0b10;
            case "-":
                charNum = 0b100100;
            case ".":
                charNum = 0b110010;
            case "?":
                charNum = 0b100110;
            case " ":
                appendChar = " "
            default:
                appendChar = "";
            }
            if charNum != 0 {
                appendChar = String(UnicodeScalar(10240 + charNum))
            }
            encodedText += appendChar
        }
        
        return encodedText
    }
    
    func decodeBraille(text: String) -> String {
        var decodedText: String = ""
        var needNumber: Bool = false
        var needUpper: Bool = false
        
        for char in text {
            var codePoint: UInt32 = 0
            if char.unicodeValue() > 10240 {
                codePoint = char.unicodeValue() - 10240
            }
            var appendChar: String = ""
            if codePoint == 0b100000 {
                needUpper = true
            } else if codePoint == 0b111100 {
                needNumber = true
            } else {
                if needNumber {
                    switch (codePoint) {
                        case 1:
                            appendChar = "1";
                        case 0b11:
                            appendChar = "2";
                        case 0b1001:
                            appendChar = "3";
                        case 0b11001:
                            appendChar = "4";
                        case 0b10001:
                            appendChar = "5";
                        case 0b1011:
                            appendChar = "6";
                        case 0b11011:
                            appendChar = "7";
                        case 0b10011:
                            appendChar = "8";
                        case 0b1010:
                            appendChar = "9";
                        case 0b11010:
                            appendChar = "0";
                        default:
                            appendChar = "";
                    }
                    needNumber = false
                } else {
                    switch (codePoint) {
                        case 1:
                            appendChar = "a";
                        case 0b11:
                            appendChar = "b";
                        case 0b1001:
                            appendChar = "c";
                        case 0b11001:
                            appendChar = "d";
                        case 0b10001:
                            appendChar = "e";
                        case 0b1011:
                            appendChar = "f";
                        case 0b11011:
                            appendChar = "g";
                        case 0b10011:
                            appendChar = "h";
                        case 0b1010:
                            appendChar = "i";
                        case 0b11010:
                            appendChar = "j";
                        case 0b101:
                            appendChar = "k";
                        case 0b111:
                            appendChar = "l";
                        case 0b1101:
                            appendChar = "m";
                        case 0b11101:
                            appendChar = "n";
                        case 0b10101:
                            appendChar = "o";
                        case 0b1111:
                            appendChar = "p";
                        case 0b11111:
                            appendChar = "q";
                        case 0b10111:
                            appendChar = "r";
                        case 0b1110:
                            appendChar = "s";
                        case 0b11110:
                            appendChar = "t";
                        case 0b100101:
                            appendChar = "u";
                        case 0b100111:
                            appendChar = "v";
                        case 0b111010:
                            appendChar = "w";
                        case 0b101101:
                            appendChar = "x";
                        case 0b111101:
                            appendChar = "y";
                        case 0b110101:
                            appendChar = "z";
                        case 0b10110:
                            appendChar = "!";
                        case 0b100:
                            appendChar = "\"";
                        case 0b10:
                            appendChar = ",";
                        case 0b100100:
                            appendChar = "-";
                        case 0b110010:
                            appendChar = ".";
                        case 0b100110:
                            appendChar = "?";
                        default:
                            appendChar = " ";
                    }
                    if needUpper {
                        appendChar = appendChar.uppercaseString
                        needUpper = false
                    }
                }
                decodedText += appendChar
            }
        }
        
        return decodedText
    }
    
}


