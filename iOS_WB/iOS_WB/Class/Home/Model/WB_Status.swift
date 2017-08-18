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
    var verified_type : Int = -1 // 基本类型的数据最好赋值
    required override init() {
        
    }
}

class WB_Status: NSObject,HandyJSON {
    
    var created_at : String?
    var idstr : String?
    var source : String?
    var reposts_count : String?
    var comments_count : String?
    var user : User?
    
    required  override   init() {
    }
    
}
