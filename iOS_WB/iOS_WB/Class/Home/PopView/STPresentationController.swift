//
//  STPresentationController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/5.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

class STPresentationController: UIPresentationController {
    //保存菜单的尺寸 
    var presentFrame = CGRect.zero
    
    override func containerViewWillLayoutSubviews() {
        // 用于布局专场动画弹出的空间
//        containerView?.addSubview(coverButton)
        containerView?.insertSubview(coverButton, at: 0)
       coverButton.addTarget(self, action: #selector(buttonAction(but:)), for: .touchUpInside)
        presentedView?.frame = presentFrame
    }
    
    // MARK : 内部控制方法
    @objc private func buttonAction(but:UIButton){
        STLog(message: "\(presentedViewController) + \(presentingViewController)")
        // 让菜单消失
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    //     MARK : 懒加载
    private lazy  var  coverButton:UIButton = {
        let but = UIButton()
        but.frame = UIScreen.main.bounds
        but.backgroundColor = UIColor.clear
        
        return but
    }()
    
}
