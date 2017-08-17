//
//  String+Extern.swift
//  iOS_WB
//
//  Created by Alpha on 17/08/2017.
//  Copyright © 2017 STT. All rights reserved.
//

import Foundation


extension String {
    
    // 快速生产缓存路径
    func cachesDir()->String{
        
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        // 2 生成路径
        let name = (self as NSString).lastPathComponent
        let filePath = (path as NSString).appendingPathComponent(name)
        
        return filePath
        
    }
    
    // 快速生产文档路径
    func docDir()->String{
        
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let filePath = (path as NSString).appendingPathComponent(self)
        
        return filePath
    }
    //快速生成临时路径
    func tmpDir()->String{
        
        let path = NSTemporaryDirectory()
        let filePath = (path as NSString).appendingPathComponent(self)
        
        return filePath
    }
    
}
