//
//  AppDelegate.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/10.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

// commond + shift + j 可以快速定位到导航条 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
   // 在swift 中是没有宏定义的
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 1 创建window
//        window = UIWindow.init(frame: UIScreen.main.bounds)
//        window?.backgroundColor = UIColor.white
//        window?.rootViewController = MainTabBarViewController()
//        
//        window?.makeKeyAndVisible()
        UINavigationBar.appearance().tintColor = UIColor.orange
        return true
    }
}
//  1 .swift 开发中 由于编译器可以通过 复制的类型制动推到出数据的真实类型，所以在swift开中能不写数据类型，就不写数据类型，有点事可以减少冗余代码
/*
 2  泛型
 如果要在函数中使用泛型 必须告诉系统这个函数是一个泛型 需要在行参列表和函数名之间添加一堆<>
 eg func 函数名<T>(行参列表)->{}
 message 是T 类型，具体message的类型 是由调用者传递进去的类型决定的
 */
func STLog<T>(message:T,fileName:String = #file,methodName:String = #function,lineNumber:Int = #line) {

//    print("\(String(describing: (fileName as NSString).pathComponents.last!)).\(methodName)[\(lineNumber)]:\(message)")
    #if DEBUG
     print("\(methodName)[\(lineNumber)]:\(message)")
    #endif
}

