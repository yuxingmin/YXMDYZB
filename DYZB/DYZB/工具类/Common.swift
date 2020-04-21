//
//  Common.swift
//  DYZB
//
//  Created by xingmin yu on 2020/4/16.
//  Copyright © 2020 xingmin yu. All rights reserved.
//

import Foundation
import UIKit

let IS_IOS_11 : Bool = (Float(UIDevice.current.systemVersion)!>=11.0)
let IS_iPhone_X:Bool = ISiPhoneX()



let YXMStatusBarH : CGFloat = 20
let YXMNavigationBarH : CGFloat = 44
let YXMTabbarH : CGFloat = 49
let YXMTopOffSetH : CGFloat = IS_iPhone_X ? 24.0:0
let YXMBottomOffSetH : CGFloat = IS_iPhone_X ? 34.0:0


let YXMTopH : CGFloat = YXMStatusBarH+YXMNavigationBarH+YXMTopOffSetH
let YXMBottomH : CGFloat = YXMTabbarH+YXMBottomOffSetH

let YXMScreenW = UIScreen.main.bounds.width
let YXMScreenH = UIScreen.main.bounds.height
func ISiPhoneX() ->Bool {
    let screenHeight = UIScreen.main.nativeBounds.size.height;
    if screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
        return true
    }
    return false
}
