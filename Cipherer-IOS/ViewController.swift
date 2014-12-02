//
//  ViewController.swift
//  Cipherer-IOS
//
//  Created by Rytis Stankus on 12/2/14.
//  Copyright (c) 2014 Rytis Stankus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var menuList: [String] = ["Vignere", "ROT", "ASCII", "Braille"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame:CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section:    Int) -> Int {
        return menuList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "MyTestCell")
        
        cell.textLabel.text = menuList[indexPath.row]
        
        return cell
    }
}

