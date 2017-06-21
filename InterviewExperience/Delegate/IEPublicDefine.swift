//
//  IEPublicDefine.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/21.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit


let ScreenWidth = UIScreen.main.bounds.width;

let ScreenHeight = UIScreen.main.bounds.height;


/// RGB颜色
/// - Parameters:
///   - red: 红
///   - green: 绿
///   - blue: 蓝
///   - alpha: 透明色
/// - Returns: 返回颜色值
func RGBA(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat) -> UIColor {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha);
}
