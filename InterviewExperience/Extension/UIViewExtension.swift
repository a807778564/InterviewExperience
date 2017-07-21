//
//  UIImageExtension.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/21.
//  Copyright © 2017年 note. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    
    class func imageWithColor(color:UIColor,size:CGSize) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img!;
    }
}

extension String {
    //获取子字符串
    func substingInRange(r: Range<Int>) -> String? {
        if r.lowerBound < 0 || r.upperBound > self.characters.count{
            return nil
        }
        let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
        return self.substring(with:startIndex..<endIndex)
    }
}

extension UILabel{
    
    class func label(text:String,textColor:UIColor,font:CGFloat) -> UILabel{
        let label = UILabel();
        label.text = text;
        label.textColor = textColor;
        label.font = UIFont.systemFont(ofSize:font);
        return label;
    }
    
}

extension UIButton{
    
    class func button(normalImage:String,heightImage:String) ->UIButton{
        let btn = UIButton(type: UIButtonType.custom);
        btn.setImage(UIImage(named:normalImage), for: UIControlState.normal);
        btn.setImage(UIImage(named:heightImage), for: UIControlState.highlighted);
        return btn;
    }
    
    class func button(title:String,font:CGFloat,color:UIColor) ->UIButton{
        let btn = UIButton(type: UIButtonType.custom);
        btn.setTitle(title, for: UIControlState.normal);
        btn.titleLabel?.font = UIFont.systemFont(ofSize: font);
        btn.setTitleColor(color, for: UIControlState.normal);
        return btn;
    }
    
}

extension UIView{
    
     func setLayer(cornerRadiu:CGFloat,borderColor:UIColor,width:CGFloat) {
        self.layer.cornerRadius = cornerRadiu;
        self.layer.borderWidth = width;
        self.layer.borderColor = borderColor.cgColor;
        self.layer.masksToBounds = true;
    }
    
    
    func showTost(text:String) -> Void{
        let mess = UILabel.label(text: text, textColor: RGBA(red: 100, green: 100, blue: 100, alpha: 1), font: 14);
        mess.setLayer(cornerRadiu: 4.0, borderColor: LabelDesColor, width: 1.0);
        mess.textAlignment = NSTextAlignment.center;
        mess.numberOfLines = 2;
        mess.alpha = 0;
        mess.backgroundColor = LabelDesColor;
        self.addSubview(mess);
        
        mess.mas_makeConstraints { (make) in
            make?.centerY.equalTo()(self.mas_centerY);
            make?.centerX.equalTo()(self.mas_centerX);
            if(mess.font.pointSize * CGFloat(text.characters.count) > ScreenWidth/2){
                make?.width.offset()(ScreenWidth/2+30);
                make?.height.offset()(getNewTextSize(_text: text as NSString, _font: 14, _width: Int(ScreenWidth/2)).height+10);
            }else{
                make?.width.offset()(mess.font.pointSize * CGFloat(text.characters.count)+30);
                make?.height.offset()(getNewTextSize(_text: text as NSString, _font: 14, _width: Int(ScreenWidth/2)).height+10);
            }
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            mess.alpha = 1;
        }) { (finish) in
            UIView.animate(withDuration: 2.0, animations: {
                mess.alpha = 0;
            }, completion: { (finish) in
                mess.removeFromSuperview();
            })
        }
        
    }

}
