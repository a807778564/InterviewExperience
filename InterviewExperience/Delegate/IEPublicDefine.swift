//
//  IEPublicDefine.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/21.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit


let ScreenWidth = UIScreen.main.bounds.width;//屏幕宽

let ScreenHeight = UIScreen.main.bounds.height;//屏幕高

let TinColor = RGBA(red:47,green:186,blue:163,alpha:1);//主要色

let BackColor = RGBA(red:245,green:245,blue:245,alpha:1);//背景

let LabelMainColor = RGBA(red: 155, green: 155, blue: 155, alpha: 1);

let LabelDesColor = RGBA(red: 200, green: 200, blue: 200, alpha: 1);



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


///   获取文本高度
/// - Parameters:
///   - _text: 文本
///   - _font: 字体大小
///   - _width: 文本宽度
/// - Returns: 返回文本宽高
func getNewTextSize(_text:NSString,_font:CGFloat,_width:Int) -> CGSize{
    let paragraph = NSMutableParagraphStyle();
    paragraph.alignment = NSTextAlignment.center;
    var font = UIFont.systemFont(ofSize: _font);
    if (_font == 22){
        font = UIFont.init(name: "HelveticaNeue-Bold", size: 22)!;
    }
    let attribute = NSDictionary(objects: [font,paragraph], forKeys: [NSFontAttributeName as NSCopying,NSParagraphStyleAttributeName as NSCopying]);
    return _text.boundingRect(with: CGSize(width:_width,height:10000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attribute as? [String : Any], context: nil).size;
}

func checkTelNumber(tel:NSString) -> Bool{
    if (tel.isEqual(to: "")){
        return false;
    }

    guard let regex = try?NSRegularExpression(pattern: "^1[3|4|5|7|8|9]\\d{9}$", options: []) else {
        return false;
    };
    let r = regex.firstMatch(in: tel as String, options: [], range:NSRange(location: 0, length: tel.length))
    return r != nil;
}




