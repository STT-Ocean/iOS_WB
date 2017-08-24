//
//  HomeTableViewController.swift
//  iOS_WB
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 STT. All rights reserved.
//
// swift 中有dealloc 的方法吗？ 在哪里进行移除
import UIKit

class HomeTableViewController: Base_TableViewController {
    private var  dataArray : Array<WB_Status> = [] // 数组可以使用这种方法进行初始化
    {
        didSet{
            // didSet 方法
            
        }
    }
//    var dataArray :[WB_Status]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visiterView?.setUpVisitorInfo(imageName: nil, title: "这里是首页，欢迎来到首页")
        setUpNavigationItem()
        
        NotificationCenter.default.addObserver(self, selector: #selector(titleButtonAction), name: NSNotification.Name(STPresentManagerDidDismisstedController), object: animatorManager)
        NotificationCenter.default.addObserver(self, selector: #selector(titleButtonAction), name: Notification.Name(STPresentManagerDidPresentedController), object: animatorManager)
        WB_NetWorkTools.shareInstance.getHomeUserData { (status, error ) in
            self.dataArray = status
            self.tableView.reloadData()
            
        }
        tableView.separatorStyle = .none
        // 效果比较简单的时候可以这样使用 实际开发中不会这样使用
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    private func setUpNavigationItem(){
        setNavigationControllerBarLeftItemAndRightItem(leftImageName: "navigationbar_friendattention", rightImageName: "navigationbar_pop")
        // 添加导航条按钮
        
        navigationItem.titleView = titleButton
        titleButton.addTarget(self, action: #selector(navigationTitleViewAction(titleView:)), for: .touchUpInside)
    }
    // MARK: -- 导航条方法
    override func navigationLeftButtonAction(leftItem:UIButton){
        
    }
    override func navigationRightButtonAction(rightItem: UIButton) {
        
    }
    
    @objc func navigationTitleViewAction(titleView:Title_Button){
//        titleView.isSelected = !titleView.isSelected
        // 显示菜单
        let sb = R.storyboard.popView
       // let sb = UIStoryboard.init(name: "PopView", bundle: nil)
        guard
            let menuView = sb.instantiateInitialViewController() else {
                
                return
        }
        // 自定义专场动画
        // 1 设置转场代理
        menuView.transitioningDelegate = animatorManager
        // 2 设置转场的动画样式
        menuView.modalPresentationStyle = .custom
        present(menuView, animated: true) {
        }
    }
    @objc private func titleButtonAction(){
        // 切换按钮的状态
        titleButton.isSelected = !titleButton.isSelected
        
    }
    // MARK: 懒加载
    // 将代理方法单独抽取出来 用来负责专场
    private lazy var animatorManager:STPresentManager = {
      let manager = STPresentManager()
      manager.presentFrame = CGRect(x:100,y:45,width:200,height:400)
      return manager
    }()
    
    private lazy var titleButton : Title_Button  = {
        let titleView = Title_Button.init()
        titleView.setTitle("首页", for: .normal)
        return titleView
    }()
    
    // 在oc中调用dealloc 方法 在swift中调用deinit 方法
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count 
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Home_StatusCell", for: indexPath) as! Home_StatusCell
        cell.status = self.dataArray[indexPath.row]
        return cell
    }
}

