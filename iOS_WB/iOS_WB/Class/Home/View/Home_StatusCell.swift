//
//  Home_StatusCell.swift
//  iOS_WB
//
//  Created by Alpha on 18/08/2017.
//  Copyright © 2017 STT. All rights reserved.
//

import UIKit
import SDWebImage

class Home_StatusCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var enterPrise: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var vipImage: UIImageView!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var status : WB_Status?{
        didSet{
            if let urlStr = status?.user?.profile_image_url {
                iconImage.sd_setImage(with: URL.init(string: urlStr))
            }
            var name : String?
            // 需要注意的是 swift switch 语句其他有很多不同之处，不需要break
            if  let avatarCae = status?.user?.verified_type  {
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
            
            if let rank = status?.user?.mbrank {
                if rank >= 1 && rank < 6 {
                   vipImage.image = UIImage.init(named: "common_icon_membership_level\(rank)")
                    nickName.textColor = UIColor.orange
                }else{
                    vipImage.image = nil
                    nickName.textColor = UIColor.black
                }
            }
            
            enterPrise.image = UIImage.init(named: name!)
            nickName.text = status?.user?.screen_name
            contentLabel.text  = status?.text
            // swift 4 中 where 语句和swift 3 中不一样
            if let sourceString : NSString = status?.source! as NSString?, sourceString != "" {
                let startIndex = sourceString.range(of: ">").location + 1
                let endIndex = sourceString.range(of: "<", options: NSString.CompareOptions.backwards).location
                // 倒序查找
                let sour = sourceString.substring(with: NSMakeRange(startIndex, endIndex - startIndex))
                source.text = sour
            }
            
            if let time = status?.created_at {
                let formatter = DateFormatter()
                let createData = Date.createDate(time, "EE MM dd HH:mm:ss Z yyyy")
                timeLabel.text = createData.descriptionStr()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
