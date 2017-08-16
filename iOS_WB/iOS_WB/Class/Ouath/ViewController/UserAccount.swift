//
//  UserAccount.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit



class UserAccount: HandyJSON {
    
    var access_token : String?
    var  expires_in : Int = 0
    var  remind_in : String?
    var  uid : String?
    
    
    required init() {
    }
    
//     init(dict : [String : Any]) {
//        super.init()
//        self.setValuesForKeys(dict)
//    }
//
//    override func setValue(_ value: Any?, forKey key: String) {
//        super.setValue(value, forKey: key)
//    }
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//
//    }
}
