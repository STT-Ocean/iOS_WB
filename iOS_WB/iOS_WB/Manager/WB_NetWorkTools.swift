//
//  WB_NetWorkTools.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit
import AFNetworking


class WB_NetWorkTools: AFHTTPSessionManager {
    
    static let shareInstance:WB_NetWorkTools = {
        let manager =  WB_NetWorkTools.init(baseURL: URL.init(string: WB_Base_url), sessionConfiguration: URLSessionConfiguration.default)
        
        var sets = NSSet.init(array: ["application/json","text/plain","text/javascript"])
        // 告诉AFN 需要进行支持textPlain的类型数据
        manager.responseSerializer.acceptableContentTypes =  sets as? Set<String>
        return manager
    }()
}
