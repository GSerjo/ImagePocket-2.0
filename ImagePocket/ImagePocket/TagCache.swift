//
//  TagCache.swift
//  ImagePocket
//
//  Created by Serjo on 09/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

class TagCache {
    
    static let sharedInstance = TagCache()
    let cache: [TagEntity] = [TagEntity(name: "Tag1"), TagEntity(name: "Tag2")]
    
    private init(){
        
    }
    
    var tags: [TagEntity]{
        return cache
    }
    
    var tagCount: Int{
        return cache.count
    }
    
    subscript(index: Int) -> TagEntity{
        return cache[index]
    }
}