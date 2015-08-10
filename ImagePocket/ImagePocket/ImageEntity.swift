//
//  ImageEntity.swift
//  ImagePocket
//
//  Created by Serjo on 09/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

final class ImageEntity {
    
    var tags: [TagEntity] = []
    var localIdentifier: String = String.empty
    
    func addTag(tag: TagEntity){
        tags.append(tag)
    }
}