//
//  IERelaseTextView.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/7/6.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IERelaseTextView: UITextView {
    
    override var selectedRange: NSRange{
        
        didSet{
            print(self.text.substingInRange(r: selectedRange.location..<selectedRange.length) as Any);
        }
    }
    
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if (action == #selector(copy(_:))) {
            return true;
        }else if (action == #selector(select(_:))) {
            return true;
        }else if (action == #selector(paste(_:))) {
            return true;
        }
        // 事实上一个return NO就可以将系统的所有菜单项全部关闭了
        return false;
    }
    
    
    
}
