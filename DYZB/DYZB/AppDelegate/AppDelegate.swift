//
//  AppDelegate.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/15.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window!.frame = UIScreen.main.bounds;
        
        
        
        let rootVC:MainTabBarViewController = MainTabBarViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        UITabBar.appearance().tintColor = UIColor.orange
        
        return true
    }
}

