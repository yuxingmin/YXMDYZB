//
//  PageTitleView.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/15.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import UIKit

// MARK:- 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

protocol PageTitleViewDelegate : class {
    func pagetitleView(titleView:PageTitleView,selectIndex:Int)
}



class PageTitleView: UIView {

    fileprivate var currentindex = 0;
    
    fileprivate var titles:[String]
    fileprivate var titleLabels:[UILabel] = [UILabel]()
    weak var delegate:PageTitleViewDelegate?
    
    
    fileprivate lazy var scrollView:UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = true;
        scrollView.frame = self.bounds
        return scrollView
    }()
    fileprivate lazy var processView:UIView = {
       let processView = UIView()
        processView.backgroundColor = UIColor.orange
        return processView
    }()
    
    
    init(frame: CGRect, titles:[String]) {
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
        backgroundColor = UIColor.white
        addSubview(scrollView)
        setupLables()
        setupLineAndProcessView()
    }
    
    fileprivate func setupLables(){
        let labW = frame.width/CGFloat(titles.count)>80 ? frame.width/CGFloat(titles.count):80
        let labH = frame.height-kScrollLineH
        let labY:CGFloat = 0
        scrollView.contentSize = CGSize(width: labW*CGFloat(titles.count), height: frame.height)
        for (index,title) in titles.enumerated() {
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textAlignment = .center
            label.textColor = UIColor.lightGray
            
            let labelX:CGFloat = labW*CGFloat(index)
            label.frame = CGRect(x: labelX, y: labY, width: labW, height: labH)
            
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:)))
            label.addGestureRecognizer(tapGes)
            
            
            scrollView.addSubview(label)
            titleLabels.append(label)
        }

    }

    
    fileprivate func setupLineAndProcessView(){
        let lineFrame = CGRect(x: 0, y: frame.height-0.5, width: frame.width, height: 0.5)
        
        let lineView = UIView(frame: lineFrame)
        lineView.backgroundColor = UIColor.lightGray
        self.addSubview(lineView)
        
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor.orange
        scrollView.addSubview(processView)
        processView.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height-kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        
        
    }

}

// MARK: - 点击label
extension PageTitleView{

    @objc fileprivate func titleLabelClick(_ tapGes:UITapGestureRecognizer){
        guard let currentLabel = tapGes.view as? UILabel else { return  }
        if currentLabel.tag == currentindex {
            return
        }
        
        let oldLabel = titleLabels[currentindex]
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.lightGray
        
        currentindex = currentLabel.tag
        let lineX:CGFloat = CGFloat(currentindex)*processView.frame.width
        UIView.animate(withDuration: 0.3) {
            self.processView.frame.origin.x = lineX
        }
        
        delegate?.pagetitleView(titleView: self, selectIndex: currentindex)
    }
}
