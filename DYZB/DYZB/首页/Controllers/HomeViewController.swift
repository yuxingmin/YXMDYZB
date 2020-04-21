//
//  HomeViewController.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/15.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    fileprivate lazy var pageTitleView:PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: YXMTopH, width: YXMScreenW, height: 50)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
        }()
    fileprivate lazy var pageContentView:PageContentView = {[weak self] in
        
        // 1.确定内容的frame
        let contentH = YXMScreenH - YXMTopH-YXMBottomH-50
        let contentFrame = CGRect(x: 0, y: YXMTopH + 50, width: YXMScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        childVcs.append(GameViewController())
        childVcs.append(AmuseViewController())
        childVcs.append(FunnyViewController())
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
//        contentView.delegate = self
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
}

extension HomeViewController{
    func setupUI() -> Void {
        self.navigationItem.title = ""
        setupNavigationBar()
        self.view.addSubview(pageTitleView)
        self.view.addSubview(pageContentView)
    }
    
    func setupNavigationBar() -> Void {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "logo"), style: .done, target: self, action: #selector(backAction))
        
        
        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", heightImage: "Image_my_history_click", size: size)//UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", heightImage: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", heightImage: "Image_scan_click", size: size)
        self.navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem];
    }
    
    @objc private func backAction() {
        print("======")
    }
    
}


extension HomeViewController:PageTitleViewDelegate
{
    func pagetitleView(titleView: PageTitleView, selectIndex: Int) {
        print(selectIndex)
    }
}
extension HomeViewController:PageContentViewDelegate
{
    func PageContentView(contentView: PageContentView, process: CGFloat, sourceIndex: Int, targetIndex: Int) {
        print(targetIndex)
    }
}

