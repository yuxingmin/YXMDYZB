//
//  HomeViewController.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/15.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    fileprivate lazy let pageTitleView:PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: 20 + 44, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}
