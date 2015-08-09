//
//  ImageCache.swift
//  ImagePocket
//
//  Created by Serjo on 09/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation
import Photos

class ImageCache{
    
    static let sharedInctace = ImageCache()
    
    private let _fetchResult: PHFetchResult
    private var _assets = [String: PHAsset]()
    private let _imageRepository = ImageRepository.sharedInstance
    private var _taggedImages = [String: ImageEntity]()
    
    
    private init(){
        
        _taggedImages = _imageRepository.getAll().toDictionary{$0.localIdentifier}
        
        _fetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: nil)
        var assets: [PHAsset] = []
        
        _fetchResult.enumerateObjectsUsingBlock{(object, id, _) in
            if let asset = object as? PHAsset{
                assets.append(asset)
            }
        }
    }
}