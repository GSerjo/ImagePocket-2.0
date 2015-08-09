//
//  LeftSideViewController.swift
//  ImagePocket
//
//  Created by Serjo on 07/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

class LeftSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let tagCache = TagCache.sharedInstance
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.hidden = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagCache.tagCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TagTableViewCell", forIndexPath: indexPath) as! TagTableViewCell
        cell.name.text = tagCache[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tagEntity = tagCache[indexPath.row]
        
        let centerViewController  = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        centerViewController.filterImage(tagEntity)
        
        let centerSideNavigation = UINavigationController(rootViewController: centerViewController)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer.centerViewController = centerSideNavigation
        appDelegate.centerContainer.toggleDrawerSide(.Left, animated: true, completion: nil)
    }
}
