//
//  Title_Button.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/28.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

class Title_Button: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpButtonUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setUpButtonUI()
    }
    
    fileprivate func setUpButtonUI(){
        setImage(UIImage.init(named: "navigationbar_arrow_down"), for: .normal)
        setImage(UIImage.init(named: "navigationbar_arrow_up"), for: .selected)
        setTitleColor(UIColor.lightGray, for: .normal)
        isHighlighted = false
        sizeToFit()
    }
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title! + "  ", for: .normal)
    }
    
    // title Button
    override func layoutSubviews() {
        super.layoutSubviews()
//         offsetBy 属性的作用
//        titleLabel?.frame.offsetBy(dx: -imageView!.frame.size.width, dy: 0)
//        imageView?.frame.offsetBy(dx: titleLabel!.frame.size.width, dy: 0)
        // 和oc不一样swift语法中允许直接修改对象的结构体属性
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
}
