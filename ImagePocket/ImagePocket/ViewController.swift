//
//  ViewController.swift
//  ImagePocket
//
//  Created by Serjo on 06/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = MMDrawerBarButtonItem(target: self, action: "leftBarButtonItemPressed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func leftBarButtonItemPressed(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }

}

