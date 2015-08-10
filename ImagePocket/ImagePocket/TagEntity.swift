//
//  TagEntity.swift
//  ImagePocket
//
//  Created by Serjo on 09/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

final class TagEntity: CustomStringConvertible {
    
    static let all = TagEntity(name: "All")
    static let untagged = TagEntity(name: "Untagged")
    
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    var description: String{
        return "Name: \(name)"
    }
    
    convenience init() {
        self.init(name: String.empty)
    }
}