//
//  WB_Status.swift
//  iOS_WB
//
//  Created by Alpha on 17/08/2017.
//  Copyright © 2017 STT. All rights reserved.
//

import UIKit

class User: NSObject,HandyJSON {
    var idstr : String?
    var profile_image_url : String?
    var screen_name : String?
    var verified: Bool = false
    // -1 没有认证   0 个人认证  235 企业  220
    var verified_type : Int = -1 // 基本类型的数据最好赋值
    // 1- 6
    var mbrank : Int = -1
    
    required override init() {
        
    }
}

class WB_Status: NSObject,HandyJSON {
    
    var created_at : String?
    var idstr : String?
    var source : String?{
        didSet{
            
        }
    }
    var reposts_count : String?
    var comments_count : String?
    var user : User?
    var text : String? 
    required  override   init() {
        
    }
    
}
