//
//  PageContentView.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/16.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import UIKit


private let ContentCellID = "ContentCellID"

protocol PageContentViewDelegate:class {
    func PageContentView(contentView:PageContentView,process:CGFloat,sourceIndex:Int,targetIndex:Int)
}


class PageContentView: UIView {
    
    fileprivate var childVcs:[UIViewController]
    fileprivate var parentViewController:UIViewController?
    fileprivate var startOffsetX : CGFloat = 0
    weak var delegate : PageContentViewDelegate?
    
    
    fileprivate lazy var collectionView:UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: self!.bounds, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    }()
    
    
    
    init(frame: CGRect, childVcs : [UIViewController], parentViewController : UIViewController?) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        setupUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PageContentView{
    fileprivate func setupUI(){
        backgroundColor = UIColor.white
        self.addSubview(collectionView)
    }
    
    
}



extension PageContentView:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.childVcs.count;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        
        let chileVC = self.childVcs[indexPath.row]
        chileVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(chileVC.view)
            
        
        return cell;
    }
}


extension PageContentView:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("========")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffsetX = scrollView.contentOffset.x
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var progress : CGFloat = 0
        var sourceIndex : Int = 0
        var targetIndex : Int = 0
        
        let currentOffsetX = scrollView.contentOffset.x
        let scrollViewW = scrollView.bounds.width
        if currentOffsetX>startOffsetX {
            progress = currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW)
            sourceIndex = Int(currentOffsetX / scrollViewW)
            sourceIndex = sourceIndex+1
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            // 4.如果完全划过去
            if currentOffsetX - startOffsetX == scrollViewW {
                progress = 1
                targetIndex = sourceIndex
            }
        }
        else
        {
            // 1.计算progress
            progress = 1 - (currentOffsetX / scrollViewW - floor(currentOffsetX / scrollViewW))
            
            // 2.计算targetIndex
            targetIndex = Int(currentOffsetX / scrollViewW)
            
            // 3.计算sourceIndex
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count {
                sourceIndex = childVcs.count - 1
            }
        }
        delegate?.PageContentView(contentView: self, process: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
        
    }
    
    
}
