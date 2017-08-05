//
//  Base_TableViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/26.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit


class Base_TableViewController: UITableViewController {
    var isLogin  = true
    var visiterView :VisiterView?
    
    override func loadView() {
        
        // 判断用户是否登录， 如果登录就显示该有的页面，乳沟没有登录就登录
        if isLogin {
            super.loadView()
        }else{
            setUpVisitView()
        }
        
    }
    // MARK: 内部控制方法
    //  只能在当前文件中进行访问
   private  func setUpVisitView()  {
    visiterView = VisiterView.visiterView()
    view = visiterView
    // 在swift中如果要实现协议一般会使用扩展来进行 是为了提高代码的阅读性
//    visiterView?.delegate = self
    
    visiterView?.registerBut.addTarget(self, action: #selector(registerAction(register:))  , for: .touchUpInside)
    visiterView?.loginBut.addTarget(self, action: #selector(loginAction(loginBut:)), for: .touchUpInside)
    }
    
    // MARK : - visiterView 的代理方法
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func registerAction(register: UIButton){
        STLog(message: "开心的 注册")
    }
    @objc func loginAction(loginBut: UIButton){
        STLog(message: "开心的 登录吧")
    }
    

}


//// swift 中一般为了提高代码的可读性 会将代理同一方在扩展中
//extension Base_TableViewController :VisiterViewDelegate  {
//    func visitorViewDidClickLoginBut(visitor: VisiterView) {
//
//    }
//    func visitorViewDidClickRegisterBut(visitor: VisiterView) {
//
//    }
//}

