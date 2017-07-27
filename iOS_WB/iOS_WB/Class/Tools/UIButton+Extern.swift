//
//  UIButton+Extern.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/26.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit
// 创建分类 UIButton 的分类
extension UIButton{
    /*
     如果 构造方法前面没有convenien 代表着一个初始化构造方法（指定构造方法） 必须对所有的属性进行初始化
     如果 有则为遍历构造方法  不必对所有的属性进行初始化 ，因为遍历构造方法依赖于指定构造方法
     */
// convenience 遍历  swift 中必须在构造方法中对所有的属性进行初始化
    convenience init(imageName:String,backgroundImageName:String) {
        self.init()
        setImage(UIImage.init(named: imageName), for: .normal)
        setImage(UIImage.init(named: imageName + "_highlighted"), for: .selected)
        setBackgroundImage(UIImage.init(named: backgroundImageName), for: .normal)
        setBackgroundImage(UIImage.init(named: backgroundImageName + "_highlighted"), for: .selected)
        sizeToFit()
    }
}

