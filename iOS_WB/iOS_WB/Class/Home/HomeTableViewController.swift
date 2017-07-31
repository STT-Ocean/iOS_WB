//
//  HomeTableViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

class HomeTableViewController: Base_TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visiterView?.setUpVisitorInfo(imageName: nil, title: "这里是首页，欢迎来到首页")
        setUpNavigationItem()
    }
    
    private func setUpNavigationItem(){
        setNavigationControllerBarLeftItemAndRightItem(leftImageName: "navigationbar_friendattention", rightImageName: "navigationbar_pop")
        // 添加导航条按钮
        let titleView = Title_Button.init()
        titleView.setTitle("首页", for: .normal)
        titleView.addTarget(self, action: #selector(navigationTitleViewAction(titleView:)), for: .touchUpInside)
        navigationItem.titleView = titleView
        
    }
    // MARK: -- 导航条方法
    override func navigationLeftButtonAction(leftItem:UIButton){
        
    }
    override func navigationRightButtonAction(rightItem: UIButton) {
    }
    
    @objc func navigationTitleViewAction(titleView:Title_Button){
        titleView.isSelected = !titleView.isSelected
    }
    
}
