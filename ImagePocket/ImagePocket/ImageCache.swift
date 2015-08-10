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
    
    private var _fetchResult: PHFetchResult
    private var _assets = [String: PHAsset]()
    private let _imageRepository = ImageRepository.sharedInstance
    private var _taggedImages = [String: ImageEntity]()
    private var _actualImages = [String:ImageEntity]()
    
    
    private init(){
        
        _taggedImages = _imageRepository.getAll().toDictionary{$0.localIdentifier}
        
        _fetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: nil)
        _assets = getAssets(_fetchResult).toDictionary{$0.localIdentifier}
        var t  = _assets.values.map(createImage)
    }
    
    private func getAssets(fetchResult: PHFetchResult) -> [PHAsset]{
        var assets: [PHAsset] = []
        
        fetchResult.enumerateObjectsUsingBlock{(object, id, _) in
            if let asset = object as? PHAsset{
                assets.append(asset)
            }
        }
        return assets
    }
    
    private func createImage(asset: PHAsset) -> ImageEntity{
        let result = ImageEntity()
        result.localIdentifier = asset.localIdentifier
        return result
    }
}