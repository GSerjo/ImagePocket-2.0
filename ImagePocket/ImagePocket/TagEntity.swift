//
//  TagEntity.swift
//  ImagePocket
//
//  Created by Serjo on 09/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

class TagEntity {
    var name: String?
    
    init(name: String){
        self.name = name
    }
    
    convenience init() {
        self.init(name: String.empty)
    }
}