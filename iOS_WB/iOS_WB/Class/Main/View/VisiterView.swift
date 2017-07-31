
//
//  VisiterView.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/27.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit
/*
 swift 中的代理方法的实现
 
 */
 // 定义了一个名字为VisiterViewDelegate 的代理
//protocol VisiterViewDelegate:NSObjectProtocol {
//    func visitorViewDidClickLoginBut(visitor :VisiterView)
//    func visitorViewDidClickRegisterBut(visitor : VisiterView)
//}

class VisiterView: UIView {
    
    // swift 中代理也是要使用weak的
    
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var registerBut: UIButton!
    @IBOutlet weak var loginBut: UIButton!
    
//    weak var delegate : VisiterViewDelegate?
    // 在xib中的连线使用的是weak 而且是强制解包类型
    // 用于设置访客视图上的数据 title 是需要显示的标题
    func setUpVisitorInfo(imageName:String?,title:String){
         titleLabel.text = title
        guard imageName != nil else {
            // 是首页
            rotationView.isHidden = false
            startAnimation()
            return
        }
        // 不是首页
        rotationView.isHidden  = true
        iconImageView.image = UIImage.init(named: imageName!)
        //  首页动画效果
    }
    
    private  func startAnimation()  {
        // 默认情况下只要
        // 1 创建动画
        // 2 设置动画属性
        // 3 添加动画
        let  anima = CABasicAnimation.init(keyPath: "transform.rotation")
        anima.toValue = 2 * Double.pi
        anima.duration = 5.0
        anima.repeatCount = MAXFLOAT
//         视图消失 动画效果就会被默认移除掉 
        anima.isRemovedOnCompletion = false
        rotationView.layer.add(anima, forKey: nil)
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
        // 注册方法
        // 和oc不一样 swift中如果简单的调用代理方法不用判断代理能否响应
        // 原因 是因为  默认中协议里的方法是必须实现的
//       delegate?.visitorViewDidClickRegisterBut(visitor: self)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        // 登录方法
//        delegate?.visitorViewDidClickLoginBut(visitor: self)
    }
    
    // func oc 的 - 方法
    // class func oc 的+ 方法
    class func visiterView() -> VisiterView {
        return Bundle.main.loadNibNamed("VisiterView", owner: nil, options: nil)?.first as! VisiterView
    }
    
}


