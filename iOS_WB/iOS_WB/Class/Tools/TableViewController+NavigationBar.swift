//
//  TableViewController+NavigationBar.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/28.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

extension UIViewController{
    // 分类
    
    func setNavigationControllerBarLeftItemAndRightItem(leftImageName:String?,rightImageName:String?)  {
        guard leftImageName != nil else {
            return
        }
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageName: leftImageName!, target: self, action: #selector(navigationLeftButtonAction(leftItem:)))
        guard rightImageName != nil else {
            return
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageName: rightImageName!, target: self, action: #selector(navigationRightButtonAction(rightItem:)))
        
    }
    
    @objc func navigationLeftButtonAction(leftItem:UIButton){
        
    }
    @objc func navigationRightButtonAction(rightItem:UIButton){
        
    }
    
    
    
    
    
}
