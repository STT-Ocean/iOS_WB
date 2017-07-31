//
//  UIBarButtonItem+Exten.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/27.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience  init(imageName:String,target:Any? ,action:Selector) {
        
        let but = UIButton.init(type: .custom)
        but.setImage(UIImage.init(named: imageName), for: .normal)
        but.setImage(UIImage.init(named: imageName + "_highlighted"), for: UIControlState.highlighted)
        but.sizeToFit()
        but.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: but)
    }
    
    
}
