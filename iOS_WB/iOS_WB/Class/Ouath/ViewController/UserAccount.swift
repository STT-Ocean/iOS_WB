//
//  UserAccount.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit
import AFNetworking

private  let USERINFOKEY = "USERINFOKEY"

class UserAccount: NSObject,HandyJSON ,NSCoding{
    
    var access_token : String?
    var  expires_in : NSInteger = 0
    {
        didSet{
            expires_data = NSDate.init(timeIntervalSinceNow:TimeInterval(expires_in))
        }
    }
    var  expires_data : NSDate?
    var  remind_in : String?
    var  uid : String?
    var screen_name : String?
    var  avatar_large : String?
    
    static  let filePass = "userAccount.plist".docDir()
    
    static  var account : UserAccount?
    
    required override init() {
        
    }
    
   func saveUserAccount() -> Bool{
  
        let isArch = NSKeyedArchiver.archiveRootObject(self, toFile: UserAccount.filePass)
        return isArch
    }
    
   class  func loadUserAccount() -> UserAccount? {
        if UserAccount.account != nil {
            return UserAccount.account
        }
        guard  let userAccount = NSKeyedUnarchiver.unarchiveObject(withFile: UserAccount.filePass) as? UserAccount else {
            return UserAccount.account
        }
    // 判断是否过期
        guard  let  date = userAccount.expires_data else {
             return UserAccount.account
        }
    // 授权过期处理
        UserAccount.account = userAccount
        return  UserAccount.account
    }
    
    class func isLogin() -> Bool {
        return UserAccount.loadUserAccount() != nil
    }
    
    func loadUserInfo( ) {
        
        assert(access_token != nil, "使用该方法必须先授权")
        assert(uid != nil, "使用该方法必须要先授权")
        let para = ["access_token":access_token!,
                    "uid":uid!]
    
        
        WB_NetWorkTools.shareInstance.get(WB_GetUserInfo_url, parameters: para, progress: { (progress ) in
            STLog(message: progress)
        }, success: { (task , object ) in
            if object == nil {
                return
            }
            guard let obj = object as? [String : Any] else {
                return
            }
            self.avatar_large = obj["screen_name"] as? String
            self.screen_name = obj["avatar_large"] as? String
//            fininsh(self,nil)
            
        }) { (task , error ) in
//            fininsh(nil,error)
        }
    }
    
    
    
    
    // MARK : 归档解档
    required init?(coder aDecoder: NSCoder) {
        
        self.access_token =   aDecoder.decodeObject(forKey: "access_token") as! String?
        self.expires_in =  aDecoder.decodeInteger(forKey: "expires_in")
        self.expires_data = aDecoder.decodeObject(forKey: "expires_data") as? NSDate
        self.remind_in = aDecoder.decodeObject(forKey: "remind_in") as! String?
        self.uid  = aDecoder.decodeObject(forKey: "uid") as! String?
    }
    
    func encode(with aCoder: NSCoder) {
     // 编码
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(expires_data, forKey: "expires_data")
        aCoder.encode(remind_in, forKey: "remind_in")
        aCoder.encode(uid, forKey: "uid")
        
    }
    
}
