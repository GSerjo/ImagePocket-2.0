//
//  ImageRepository.swift
//  ImagePocket
//
//  Created by Serjo on 09/08/15.
//  Copyright © 2015 Serjo. All rights reserved.
//

import Foundation

final class ImageRepository {
    
    static let sharedInstance = ImageRepository()
    
    private init(){
    }
    
    func getAll() -> [ImageEntity]{
        return [ImageEntity]()
    }
}