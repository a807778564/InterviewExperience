//
//  IERelaseToolBarView.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/8/28.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IERelaseToolBarView: UIView {
    let itemsArrar = NSArray(objects: "字体","图片");
    
    init() {
        super.init(frame: CGRect.zero);
        let btnWidth:CGFloat = CGFloat(ScreenWidth)/CGFloat(self.itemsArrar.count);
        for i in 0...self.itemsArrar.count-1 {
            let itemBtn = UIButton.button(title: self.itemsArrar[i] as! String, font: 14, color: UIColor.black);
            itemBtn.frame = CGRect(x: btnWidth*CGFloat(i), y: 0, width: btnWidth, height: 44);
            self.addSubview(itemBtn);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
