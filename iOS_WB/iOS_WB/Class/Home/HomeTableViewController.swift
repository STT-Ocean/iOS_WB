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
    }

}
