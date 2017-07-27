//
//  DiscorverTableViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

class DiscorverTableViewController: Base_TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visiterView?.setUpVisitorInfo(imageName: "visitordiscover_image_message", title: "这里是发现，欢迎来到发现页面")
    }

}
