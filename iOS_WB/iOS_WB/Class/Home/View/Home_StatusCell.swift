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
    
//    var status : WB_Status?{
//        didSet{
//            let viewModel = StatusViewModel.init(status: status!)
//            iconImage.sd_setImage(with: viewModel.icon_url)
//            enterPrise.image = viewModel.verified_image
//
//            nickName.text = status?.user?.screen_name
//            contentLabel.text  = status?.text
//            vipImage.image = viewModel.mbrankImage
//            source.text = viewModel.source_Text
//            timeLabel.text = viewModel.create_Time
//
//        }
//    }
    // 如何这个地方 成员变量不是可选类型的，那么需要init方法 如果是可选类型的就不需要init方法
    var statusViewModel : StatusViewModel? {
        didSet{
            if statusViewModel == nil {
                return
            }
            iconImage.sd_setImage(with: statusViewModel?.icon_url)
            enterPrise.image = statusViewModel?.verified_image
            nickName.text = statusViewModel?.status.user?.screen_name
            contentLabel.text  = statusViewModel?.status.text
            vipImage.image = statusViewModel?.mbrankImage
            source.text = statusViewModel?.source_Text
            timeLabel.text = statusViewModel?.create_Time
        }
    }
    
    // MARK : 内部控制方法
    private func calculateSize() -> (CGSize,CGSize) {
        // 计算cell 和collectionView的尺寸
        // swift  oc 返回多个值需要用指针来实现 swift 返回多个值 只需要使用指针来进行实现
        
        let count = statusViewModel?.thumbnail_pic?.count
        // 没有配图
        if  count == 0 {
            return  (CGSize.zero,CGSize.zero)
        }
        if count == 1{
            
            // 1 张配图
            // 从缓冲中获得已经下载好的图片
            guard let key = statusViewModel?.thumbnail_pic?.first?.absoluteString else {
                return (CGSize.zero,CGSize.zero)
            }
            guard   let  image =  SDWebImageManager.shared().imageCache?.imageFromDiskCache(forKey: key) else {
                return (CGSize.zero,CGSize.zero)
            }
            return (image.size,image.size)
        }
        let imageWidth = 90
        let imageHeight = 90
        let imageMargion = 10
        if count == 4 {
            let row = 2
            let col = 2
        
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
