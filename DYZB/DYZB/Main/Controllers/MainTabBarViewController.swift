//
//  MainTabBarViewController.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/15.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setuiControllers()
self.setupItems()
    }
    
    func setuiControllers() {
        let home:HomeViewController = HomeViewController()
        let firstNavVC:UINavigationController = UINavigationController(rootViewController: home)
        addChild(firstNavVC)
        
        let live:LiveViewController = LiveViewController()
        let secondNavVC:UINavigationController = UINavigationController(rootViewController: live)
        addChild(secondNavVC)
        
        let mine:MineViewController = MineViewController()
        let thirdNavVC:UINavigationController = UINavigationController(rootViewController: mine)
        addChild(thirdNavVC)
        
    }
    
    func setupItems() -> Void {
        let titleArray = ["首页","直播","我的"]
        let titleArray2 = titleArray.sorted { (s1, s2) -> Bool in
            return s1>s2
        }
        print(titleArray2)
        
        let selectImageName = ["btn_home_selected","btn_column_selected","btn_user_selected"]
        let unselectImageName = ["btn_home_normal","btn_column_normal","btn_user_normal"]
        
        for (index,vc) in viewControllers!.enumerated() {
            let image = UIImage(named: unselectImageName[index])
            let selectImage = UIImage(named: selectImageName[index])
            let tbItem = UITabBarItem(title: titleArray[index], image: image, selectedImage: selectImage)
            vc.tabBarItem = tbItem
        }
    }
}
