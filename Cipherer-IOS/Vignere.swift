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
        if viewController.title == "Vignere Text" {             //Decode
            var vignereCipher: VignereCipher = lastController as VignereCipher
            var vignereText: VignereText = viewController as VignereText
            
            vignereText.keyTextField.text = vignereCipher.keyTextField.text
        } else if viewController.title == "Vignere Code" {      //Encode
            var vignereCipher: VignereCipher = viewController as VignereCipher
            var vignereText: VignereText = lastController as VignereText
            
            vignereCipher.keyTextField.text = vignereText.keyTextField.text
        }
        lastController = viewController
        return true
    }
    
    func encode(text: String, key: String) -> String {
        var encodedText: String = ""
        
        if key.isEmpty {
            encodedText = text
        } else {
            var keyLow = key.lowercaseString
            var keyPrepd: [Int]
            
            for c in keyLow {
                if (c >= "a" && c <= "z") {
                    keyPrepd.append(c as Int - "a" as Int)
                } else {
                    keyPrepd.append(0)
                }
            }
            
            for c in text {
                if (c >= "a" && c <= "z") {
                    
                }
            }
        }
        
        String encoded = "";
        if (key.isEmpty()){
            encoded = text;
        } else {
            key = key.toLowerCase();
            ArrayList<Integer> keyValues = new ArrayList<>();
            for (int i = 0; i < key.length(); ++i) {
                char c = key.charAt(i);
                if (c >= 'a' && c <= 'z') {
                    keyValues.add( c - 'a' );
                } else {
                    keyValues.add(0);
                }
            }
            for (int i = 0; i < text.length(); ++i) {
                char c = text.charAt(i);
                if (c >= 'a' && c <= 'z') {
                    c = (char) ((c - 'a' + keyValues.get(i % keyValues.size())) % 26 + 'a');
                } else if (c >= 'A' && c <= 'Z') {
                    c = (char) ((c - 'A' + keyValues.get(i % keyValues.size())) % 26 + 'A');
                }
                encoded = encoded.concat(String.valueOf(c));
            }
        }
        return encoded;
        
        return encodedText
    }

}
