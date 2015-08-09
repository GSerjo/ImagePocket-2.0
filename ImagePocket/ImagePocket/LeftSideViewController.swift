//
//  LeftSideViewController.swift
//  ImagePocket
//
//  Created by Serjo on 07/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

class LeftSideViewController: ViewController, UITableViewDataSource, UITableViewDelegate{
    
    let tagCahe = TagCache.sharedInstance
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.hidden = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagCahe.tagCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TagTableViewCell", forIndexPath: indexPath) as! TagTableViewCell
        cell.name.text = tagCahe[indexPath.row].name
        return cell
    }
}
