//
//  PageTitleView.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/15.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import UIKit

class PageTitleView: UIView {

    fileprivate var titles:[NSString]
    
    init(frame: CGRect, titles:[NSString]) {
        self.titles = titles
        super.init(frame: frame)
        setupUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PageTitleView{
    fileprivate func setupUI(){

    }
}
