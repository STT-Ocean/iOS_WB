//
//  StatusViewModel.swift
//  iOS_WB
//
//  Created by Alpha on 21/08/2017.
//  Copyright © 2017 STT. All rights reserved.
//

import UIKit
/*
 M
 V
 C
 VM 业务逻辑（1 可以对Model 和V 进行瘦身
 2 可以用来处理业务逻辑）
 */
class StatusViewModel: NSObject {
    
    // viewModel 需要有模型对象
    var status : WB_Status
     init(status: WB_Status){
        self.status = status
        // 处理认证图标
        var name : String = ""
        if  let avatarCae = status.user?.verified_type  {
            switch  avatarCae {
            case 0:
                name = "avatar_vip"
            case 2,3,5 :
                name = "avatar_enterprise_vip"
            case 220 :
                name = "avatar_grassroot"
            default:
                name = "avatar_vgirl"
            }
        }
        verified_image = UIImage.init(named: name)
        // 处理会员图标
        if let rank = status.user?.mbrank {
            if rank >= 1 && rank < 6 {
                mbrankImage = UIImage.init(named: "common_icon_membership_level\(rank)")
            }
        }
        // 处理头像
        icon_url = URL.init(string: status.user?.profile_image_url ?? "")
        
        // 处理来源
        if let sourceString : NSString = status.source! as NSString?, sourceString != "" {
            let startIndex = sourceString.range(of: ">").location + 1
            let endIndex = sourceString.range(of: "<", options: NSString.CompareOptions.backwards).location
            // 倒序查找
            let sour = sourceString.substring(with: NSMakeRange(startIndex, endIndex - startIndex))
            source_Text = sour
        }
        // 处理时间
        if let time = status.created_at {
            let createData = Date.createDate(time, "EE MM dd HH:mm:ss Z yyyy")
            create_Time = createData.descriptionStr()
        }
        
    }
    // 用户认证var <#name#> : String?
    var verified_image : UIImage?
    // 会员图片
    var mbrankImage : UIImage?
    // 图片url
    var icon_url : URL?
    // 处理来源
    var source_Text : String = ""
    // 处理时间
    var create_Time:String = ""
    
    
}
