//
//  IEEnumType.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/22.
//  Copyright © 2017年 note. All rights reserved.
//

import Foundation
import UIKit

/// 导航栏按钮的位置
/// - Left: 导航栏左侧
/// - Right: 导航栏右侧
enum IENavItem:Int {
    case Left = 1001
    case Right = 1002
}


/// 验证短信的类型
///
/// - Register: 注册
/// - FindPass: 找回密码
enum IEPhoneType:Int {
    case Register = 100001
    case FindPass = 100002
}
