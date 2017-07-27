//
//  MessageTableViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

class MessageTableViewController: Base_TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visiterView?.setUpVisitorInfo(imageName: "visitordiscover_image_message", title: "这里是发现消息页面 欢迎来到消息页面")
    }

}
