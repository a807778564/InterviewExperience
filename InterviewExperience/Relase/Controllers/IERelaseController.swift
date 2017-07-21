//
//  IERelaseController.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/7/5.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IERelaseController: IEBaseController,UITextViewDelegate {
    
    var contentTitle:UITextField!;
    var content:UITextView!;
    var conPlace:UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "0字";
        self.view.backgroundColor = UIColor.white;
        setBackArrow(imageName: "ie_relese_cancel",position: IENavItem.Left);
        setRightButtonByName(_name: "发布", _color: TinColor);
        
        let scroll = UIScrollView();
        self.view.addSubview(scroll);
        scroll.mas_makeConstraints { (make) in
            make?.edges.equalTo()(self.view);
        }
        
        self.contentTitle = UITextField();
        self.contentTitle.textColor = RGBA(red: 34, green: 34, blue: 34, alpha: 1);
        self.contentTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.contentTitle.leftViewMode = UITextFieldViewMode.always;
        self.contentTitle.tintColor = TinColor;
        self.contentTitle.placeholder = "请输入标题";
        scroll.addSubview(self.contentTitle);
        self.contentTitle.mas_makeConstraints { (make) in
            make?.leading.and().trailing().equalTo()(scroll);
            make?.top.equalTo()(scroll.mas_top);
            make?.height.offset()(40);
        }
        
        let line = UIImageView(image: UIImage(named: "ie_dotted_line_normal"));
        scroll.addSubview(line);
        line.mas_makeConstraints { (make) in
            make?.leading.and().trailing().equalTo()(scroll);
            make?.top.equalTo()(self.contentTitle.mas_bottom);
            make?.height.offset()(1);
            make?.width.offset()(ScreenWidth);
        }
        
        self.content = IERelaseTextView();
        self.content.font = UIFont.systemFont(ofSize: 15);
        self.content.tintColor = TinColor;
        self.content.textColor = RGBA(red: 34, green: 34, blue: 34, alpha: 1);
        self.content.delegate = self;
        scroll.addSubview(self.content);
        self.content.mas_makeConstraints { (make) in
            make?.top.equalTo()(line.mas_bottom);
            make?.leading.equalTo()(scroll.mas_leading)?.offset()(14);
            make?.trailing.equalTo()(scroll.mas_trailing)?.offset()(-14);
            make?.bottom.equalTo()(scroll.mas_bottom);
            make?.height.equalTo()(ScreenHeight-105);
        }
        
        self.conPlace = UILabel.label(text: "请输入内容", textColor: LabelDesColor, font: 15);
        scroll.addSubview(self.conPlace);
        self.conPlace.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.content.mas_top)?.offset()(7);
            make?.leading.equalTo()(self.content.mas_leading)?.offset()(2);
        }
        
        let edit = UIMenuItem(title: "编辑", action: #selector(editText));
        UIMenuController.shared.menuItems = [edit];
        
    }
    
    func editText() ->Void{
        print(self.content.text.substingInRange(r: self.content.selectedRange.location..<self.content.selectedRange.length) as Any);
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            self.conPlace.isHidden = false;
        }else{
            self.conPlace.isHidden = true;
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: UIColor.white, size: CGSize(width: ScreenWidth, height: 64)), for: UIBarMetrics.default);
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "ie_dotted_line_normal");
//        self.navigationController?.navigationBar.titleTextAttributes = NSDictionary(objects: [TinColor,UIFont.systemFont(ofSize: 12)], forKeys:  [NSForegroundColorAttributeName as NSCopying,NSFontAttributeName as NSCopying]) as? [String : Any];
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: RGBA(red: 47, green: 186, blue: 163, alpha: 0.8), size: CGSize(width: ScreenWidth, height: 64)), for: UIBarMetrics.default);
//        self.navigationController?.navigationBar.titleTextAttributes = NSDictionary(object: UIColor.white, forKey: NSForegroundColorAttributeName as NSCopying) as? [String : Any];
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func doLeftAction(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
