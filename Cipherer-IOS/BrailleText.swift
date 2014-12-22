//
//  BrailleText.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/22/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import UIKit

class BrailleText: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        outputTextView.endEditing(true)
    }
    
    @IBAction func clearText(sender: AnyObject) {
        outputTextView.text = ""
    }
}

