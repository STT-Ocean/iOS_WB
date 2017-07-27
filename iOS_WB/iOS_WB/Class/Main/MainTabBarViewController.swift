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
//        // 添加子控制器
//        addChildViewControllers()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.addSubview(composeButton)
        let rect = composeButton.frame.size
        let  width  = tabBar.bounds.width/CGFloat(childViewControllers.count)
        composeButton.frame = CGRect(x:2*width,y:0,width:width,height:rect.height)
//        STLog(message:  CGRect.offsetBy(rect,2 * width,0))
//        composeButton.frame = CGRect.offsetBy(rect,2 * width,0)
        
    }
    
    func  addChildViewControllers()  {
//         定义一个变量如果不修改的时候先使用let 只有真正需要修改的时候才使用var
        // 从 json 中取得数据
        
        guard    let filePath = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil) else {
            return
        }
        guard let jsonData = NSData.init(contentsOfFile: filePath) else {
            return
        }
        /*
         try 正常处理 也就是通过do catch 来处理
         try! 告诉系统一定不会有异常，也就是说可以不通过do catch 来处理，但是需要注意 开发中不推荐这样写，一旦发生程序异常就会崩溃
         try? 告诉系统可能有错 也可能没错 但是如果没有错系统会自动将结果包装成一个可选类型，如果有错系统会返回一个nil 如果使用try? 可以不通过do catch 来处理
         在开发中更推荐使用try 来进行
         */
//        let objcstring = try!  JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
//        STLog(message: objcstring)
        do{
            let objcstrng = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:AnyObject]]
            
            for dict  in objcstrng {
                STLog(message: dict)
                // swift 是强语言
                let title = dict["title"] as? String;
                let vcName = dict["vcName"] as? String;
                let imageName = dict["imageName"] as? String;
                addChildViewController(vcName, title: title, imageName: imageName)
            }
            
        }catch{
            // 只要 do 里的事情发生了异常 就会调用这个方法
             addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
             addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
             addChildViewController("DiscorverTableViewController", title: "发现", imageName: "tabbar_discover")
             addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
            addChildViewController("NullViewController", title: "我", imageName: "")
        }

    }
    /*
     swift 中新增了命名空间 作用是可以避免重复 不同项目中的命名空间是不一样的 默认情况下的命名空间的名称就是当前项目的名称
     swift 可以通过命名空间重命名 所以在使用swift的时候尽量使用cocopods进行三方框架管理，这样尽量避免类名冲突
     通过一个字符串创建一个类和oc中不一样 oc 中可以直接通过类名创建一个类，而swift中如果想通过一个类名穿件一个类 需要加上命名空间
     */
//     override 代表重写父类的方法 swift 支持方法重在 只要方法的参数个数，或者数据类型不一样 swift 就会认为是两个不同的方法 oc 中是不能出现重名的方法
//     func addChildViewController(_ childController: UIViewController,title:String,imageName:String) {
      func addChildViewController(_ childControllerName: String?,title:String?,imageName:String?) {
        // 通过字符串穿件类名 需要加上命名空间
//         命名空间可以动态获取 可选代表可能有值也可能没
//        guard 条件表达式 else {
        //            需要执行的语句 （条件为假的时候之行的语句 并且 guard {}的结尾一定要return）
//        }
        
        guard let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            // 获取命名空间失败 的操作
            return
        }
        var cla:AnyClass? = nil;
        if let vcName = childControllerName {
           cla = NSClassFromString(name + "." + vcName)
        }
        
        guard let typeClass = cla as? UITableViewController.Type else {
            return
        }
        // swift 中 如果想通过一个anyClass 来进行创建一个对象  必须告诉这个class的确切类型
         // 通过cla 穿件对象 
        let childController = typeClass.init()
        childController.title = title
        if let ivName = imageName{
            childController.tabBarItem.image = UIImage.init(named: ivName)
            childController.tabBarItem.selectedImage = UIImage.init(named: ivName + "_highlighted")
        }
        
       let navig = UINavigationController.init(rootViewController: childController)
        addChildViewController(navig)
    }
    
    
    // MARK: - 懒加载
    /*
     以下是完整的懒加载的
     */
    lazy var composeButton :UIButton = {
       () -> UIButton
        in
        let but = UIButton(imageName:"tabbar_compose_icon_add",backgroundImageName:"tabbar_compose_button")
//        let but = UIButton();
//        but.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: .normal)
//        but.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: .selected)
//        but.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: .normal)
//        but.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: .selected)
//        // 调整按钮的尺寸
//        but.sizeToFit()
//       but.addTarget(self , action: #selector(composeButtonAction), for: .touchUpInside)// 不带有参数的点击事件
        but.addTarget(self , action: #selector(composeButtonAction(compuse:)), for: .touchUpInside) // 带有参数的方法
        return but
    }()
//      swift 中有修饰 代码要遵循一些原则
    /*
     swift 中有三种修饰符 可以用来修饰属性 方法 在企业开发中建议严格控制权限，不想让别人访问的东西 一定要private
     public  在当前framework 和其他framework中进行访问
     private 私有的权限 只能在当前文件中访问
     internal  默认的权限 可以在当前frameWork中随意的访问
     */
    // 如果给按钮的监听方法添加private 就会报错，是因为事件是由于运行循环出发的，而，如果方法是私有的 则只能够在当前类中访问，而相同的情况在oc中是没有问题的
     @objc private func composeButtonAction(compuse: UIButton)  {
        
        STLog(message: "button de 点击事件")
    }
    
    
}
