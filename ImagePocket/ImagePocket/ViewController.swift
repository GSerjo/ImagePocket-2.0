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

    private var _currentTag = TagEntity.all
    private var _selectedImages = [String: ImageEntity]()
    private var _filteredImages = [ImageEntity]()
    private var _imageCache: ImageCache!
    
    private let _selectImagesTitle = "Select Images"
    private let _rootTitle = "Image Pocket"
    private let _tagButtonName = "Tag"
    private let _cancelButtonName = "Cancel"
    private var _viewMode = ViewMode.Read
    
    @IBOutlet var _btTrash: UIBarButtonItem!
    @IBOutlet var _btShare: UIBarButtonItem!
    @IBOutlet var _btSelect: UIBarButtonItem!
    private var _btTag: UIBarButtonItem!
    private var _btCancel: UIBarButtonItem!
    private var _btOpenMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = _rootTitle
        configureToolbar()
        
        if(PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.Authorized){
            startApp()
        }
        else{
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }
    
    private enum ViewMode{
        case Read
        case Select
    }
    
    
    @IBAction func onShareClicked(sender: AnyObject) {
    }
    
    @IBAction func onTrashClicked(sender: AnyObject) {
    }
    
    @IBAction func onSelectClicked(sender: AnyObject) {
        setSelectMode()
    }
    
    func onSelectCancelClicked(){
        setReadMode()
        reloadData()
    }

    
    func onTagClicked(){
        
    }
    
    func onOpenMenuClicked(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.centerContainer.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func filterImage(tagEntity: TagEntity){
        _currentTag = tagEntity
    }
    
    private func requestAuthorizationHandler(status: PHAuthorizationStatus) {
        
        if(status == PHAuthorizationStatus.Authorized){
            
            executeInMainQueue{startApp}
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
    
    private func startApp(){
        
        _imageCache = ImageCache.sharedInctace
    }
    
    private func reloadData(){
        
    }
    
    private func configureToolbar(){
        
        _btTag = UIBarButtonItem(title: _tagButtonName, style: .Plain, target: self, action: "onTagClicked")
        _btCancel = UIBarButtonItem(title: _cancelButtonName, style: .Plain, target: self, action: "onSelectCancelClicked")
        _btOpenMenu = MMDrawerBarButtonItem(target: self, action: "onOpenMenuClicked")
        navigationItem.leftBarButtonItem = _btOpenMenu

        _btTrash.enabled = false
        _btShare.enabled = false
    }
    
    private func setReadMode(){
        
        self.title = _rootTitle
        navigationItem.rightBarButtonItem = _btSelect
        navigationItem.leftBarButtonItem = _btOpenMenu
        _btTrash.enabled = false
        _btShare.enabled = false
        _selectedImages = [String: ImageEntity]()
    }
    
    private func setSelectMode(){
        
        self.title = _selectImagesTitle
        navigationItem.rightBarButtonItem = _btCancel
        navigationItem.leftBarButtonItem = _btTag
        navigationItem.leftBarButtonItem?.enabled = false
        _viewMode = ViewMode.Select
    }

}

