//
//  STPresentManager.swift
//  iOS_WB
//
//  Created by Alpha on 2017/8/5.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit
// 自定义专场展现的通知
let STPresentManagerDidPresentedController = "STPresentManagerDidPresentedController"
//只定义专场消失的通知
let STPresentManagerDidDismisstedController = "STPresentManagerDidDismisstedController"

class STPresentManager: NSObject ,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    // 定义表示 表示当前是否展现
    // MARK : UIViewControllerTransitioningDelegate
    private var isPresent = false
     var presentFrame = CGRect.zero
    // 该方法用于返回一个负责专场动画的对象 可以在该对象中控制弹出的尺寸等
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let pc = STPresentationController.init(presentedViewController: presented, presenting: presenting)
        pc.presentFrame  = presentFrame
        return pc
    }
    // 该方法用于返回一个负责专场如何出现的对象
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 发送通知告诉调用者状态发生了改变
        NotificationCenter.default.post(name: Notification.Name(rawValue: STPresentManagerDidPresentedController), object: self)
        isPresent = true
        return self
    }
    // 该方法用户返回一个专场如何消失对象
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
    NotificationCenter.default.post(name:Notification.Name(rawValue:STPresentManagerDidDismisstedController), object: self)
        isPresent = false
        // 发送通知告诉调用者状态发生了改变
        return self
    }
    
    // MARK : UIViewControllerAnimatedTransitioning
    
    // 告诉系统动画的时长 (统一管理动画事件长度)
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25;
    }
    //     用于管理model 如何展现和消失的 无论是展现还是消息都会调用该方法
    // 注 ： 只要实现了这个代理方法，那么系统就不会在有默认的动画了
    //transitionContext 所有动画需要的参数都在transitionContext 中
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        // 获取需要弹出的视图，
        //        let fromVc = transitionContext.viewController(forKey: .from)
        //        let toVc = transitionContext.viewController(forKey: .to)
        // 通过view(forKey: ）取出的值对应的是通过viewController(forKey:）取出的对应的view
        if isPresent {
            willPresentedController(transitionContext: transitionContext)
        }else{
            willDismissedController(transitionContext: transitionContext)
        }
    }
    
    private func willPresentedController(transitionContext:UIViewControllerContextTransitioning){
        // 执行展现动画
        // 2 将视图添加到从contentView上
        guard let toView =  transitionContext.view(forKey: .to) else {
            return
        }
        transitionContext.containerView.addSubview(toView)
        // 3 执行动画
        toView.transform =  __CGAffineTransformMake(1.0, 0, 0, 0, 0, 0)
        toView.layer.anchorPoint = CGPoint(x:0.5,y:0);
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.transform = CGAffineTransform.identity
        }) { (_) in
            // 注意自定义专场动画在执行完毕之后一定要告诉系统专场动画完毕了
            transitionContext.completeTransition(true)
        }
    }
    private func willDismissedController(transitionContext:UIViewControllerContextTransitioning){
        // 执行消失动画
        // 消失 拿到需要的动画
        guard let fromView =  transitionContext.view(forKey: .from) else {
            return
        }
        // 2 让动画消失 的时候改变button的frame
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            
            fromView.transform = __CGAffineTransformMake(1.0, 0.01, 0, 0, 0, 0)
            
        }, completion: { (_) in
            transitionContext.completeTransition(true)
        })
    }
    
    
}

