//
//  WB_NetWorkTools.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit
import AFNetworking
import SwiftyJSON


class WB_NetWorkTools: AFHTTPSessionManager {
    
    static let shareInstance:WB_NetWorkTools = {
        let manager =  WB_NetWorkTools.init(baseURL: URL.init(string: WB_Base_url), sessionConfiguration: URLSessionConfiguration.default)
        
        var sets = NSSet.init(array: ["application/json","text/plain","text/javascript"])
        // 告诉AFN 需要进行支持textPlain的类型数据
        manager.responseSerializer.acceptableContentTypes =  sets as? Set<String>
        return manager
    }()
    
    
   // MARK :
    func getHomeUserData(completion: @escaping (_ status:Array <WB_Status> ,_ error :Error?) -> ()){
        let userAccount = UserAccount.loadUserAccount()
        assert(userAccount?.access_token != nil,"需要授权")
        let para = ["access_token":userAccount?.access_token]
        self.get(WB_GetHome_timeLine_url, parameters: para, progress: { (progress) in
            
        }, success: { (task , object) in
            if object == nil {
                return
            }
            let obj = JSON.init(object as Any)
            let resData = obj["statuses"]
            let statusArray = [WB_Status].deserialize(from:resData.arrayObject! as NSArray )
            completion(statusArray! as! Array<WB_Status>,nil)
        }) { (_ task , _ error ) in
            
        }
    }
    
}
