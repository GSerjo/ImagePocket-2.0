//
//  ArrayExtensions.swift
//  ImagePocket
//
//  Created by Serjo on 09/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

public extension Array{
    
    func toDictionary<Key: Hashable, Value>(fn: Value -> Key) -> [Key: Value]{
        var result = [Key: Value]()
        
        for x in self {
            let item = x as! Value
            result[fn(item)] = item
        }
        return result
    }
    
}