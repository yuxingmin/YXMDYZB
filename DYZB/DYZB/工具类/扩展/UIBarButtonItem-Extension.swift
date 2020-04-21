//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/16.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import Foundation
import UIKit
extension UIBarButtonItem{
    convenience init(imageName:String,heightImage:String = "",size:CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if heightImage != "" {
            btn.setImage(UIImage(named: heightImage), for: .highlighted)
        }
        if size==CGSize.zero {
            btn.sizeToFit()
        }
        else
        {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView : btn)
    }
    

}
