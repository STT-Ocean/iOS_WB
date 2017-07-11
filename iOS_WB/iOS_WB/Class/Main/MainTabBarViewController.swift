//
//  MainTabBarViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 STT. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // ios 7 之后只需要设置tint color 那么图片和文字都会按照tintColor 进行渲染
        tabBar.tintColor = UIColor.orange
        // 添加子控制器
        addChildViewControllers()
        
    }
    
    func  addChildViewControllers()  {
//         定义一个变量如果不修改的时候先使用let 只有真正需要修改的时候才使用var
        addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
        addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
        addChildViewController("DiscorverTableViewController", title: "发现", imageName: "tabbar_discover")
        addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        
    }
    /*
     swift 中新增了命名空间 作用是可以避免重复 不同项目中的命名空间是不一样的 默认情况下的命名空间的名称就是当前项目的名称
     swift 可以通过命名空间重命名 所以在使用swift的时候尽量使用cocopods进行三方框架管理，这样尽量避免类名冲突
     通过一个字符串创建一个类和oc中不一样 oc 中可以直接通过类名创建一个类，而swift中如果想通过一个类名穿件一个类 需要加上命名空间
     
     */
//     override 代表重写父类的方法 swift 支持方法重在 只要方法的参数个数，或者数据类型不一样 swift 就会认为是两个不同的方法 oc 中是不能出现重名的方法
//     func addChildViewController(_ childController: UIViewController,title:String,imageName:String) {
      func addChildViewController(_ childControllerName: String,title:String,imageName:String) {
        // 通过字符串穿件类名 需要加上命名空间
//         命名空间可以动态获取 可选代表可能有值也可能没
        if  let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String {
            
            let cla:Any?  =  NSClassFromString(name + "." + childControllerName)
            // swift 中 如果想通过一个anyClass 来进行创建一个对象  必须告诉这个class的确切类型
            let typeClass = cla as? UITableViewController.Type
             // 通过cla 穿件对象
//            let childController = typeClass?.init()
//            STLog(message: childController)
            STLog(message: typeClass)
        }
        
        
//        childController.title = title
//        childController.tabBarItem.image = UIImage.init(named: imageName)
//        childController.tabBarItem.selectedImage = UIImage.init(named: imageName + "_highlighted")
//       let navig = UINavigationController.init(rootViewController: childController)
//        addChildViewController(navig)
    }
    
    
}
