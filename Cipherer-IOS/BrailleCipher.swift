//
//  BrailleCipher.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/22/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import UIKit

class BrailleCipher: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var dot1: UISwitch!
    @IBOutlet weak var dot2: UISwitch!
    @IBOutlet weak var dot3: UISwitch!
    @IBOutlet weak var dot4: UISwitch!
    @IBOutlet weak var dot5: UISwitch!
    @IBOutlet weak var dot6: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        outputTextView.endEditing(true)
    }
    
    @IBAction func clearText(sender: AnyObject) {
        outputTextView.text = ""
    }
    
    @IBAction func EnterChar(sender: AnyObject) {
        var offset: Int = 0;
        if (dot1.on) { offset += 0b000001; }
        if (dot2.on) { offset += 0b000010; }
        if (dot3.on) { offset += 0b000100; }
        if (dot4.on) { offset += 0b001000; }
        if (dot5.on) { offset += 0b010000; }
        if (dot6.on) { offset += 0b100000; }
        var codePoint: UInt32 = 10240 + offset;
        outputTextView.text.append(UnicodeScalar(codePoint))
        dot1.setOn(false, animated: true)
        dot2.setOn(false, animated: true)
        dot3.setOn(false, animated: true)
        dot4.setOn(false, animated: true)
        dot5.setOn(false, animated: true)
        dot6.setOn(false, animated: true)
    }
    
    @IBAction func addSpace(sender: AnyObject) {
        outputTextView.text = outputTextView.text + " "
    }
    
    @IBAction func deleteChar(sender: AnyObject) {
        outputTextView.text = dropLast(outputTextView.text)
    }
}
