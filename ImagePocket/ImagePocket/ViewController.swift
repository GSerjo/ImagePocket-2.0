//
//  ViewController.swift
//  ImagePocket
//
//  Created by Serjo on 06/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    var _currentTag = TagEntity.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ImagePocket"
        navigationItem.leftBarButtonItem = MMDrawerBarButtonItem(target: self, action: "leftBarButtonItemPressed")
        
        if(PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.Authorized){
            runApp()
        }
        else{
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func leftBarButtonItemPressed(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    func filterImage(tagEntity: TagEntity){
        _currentTag = tagEntity
    }
    
    private func requestAuthorizationHandler(status: PHAuthorizationStatus){
        
        if(status == PHAuthorizationStatus.Authorized){
            
            executeInMainQueue{runApp}
        }
        else {
            
            let alertController = UIAlertController(title: "Warning", message: "The Photo permission was not authorized. Please enable it in Settings to continue", preferredStyle: .Alert)
            let settingsAction = UIAlertAction(title: "Open Settings", style: .Default, handler: {_ in
                
                if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString){
                    UIApplication.sharedApplication().openURL(appSettings)
                }
            })
            
            alertController.addAction(settingsAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    private func executeInMainQueue(action: ()-> Void){
        dispatch_async(dispatch_get_main_queue(), action)
    }
    
    private func runApp(){
        print("runnApp")
        
    }

}

