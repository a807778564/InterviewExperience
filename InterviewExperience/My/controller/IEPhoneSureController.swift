//
//  IEPhoneSureController.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/22.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IEPhoneSureController: IEBaseController {
    
    var second = 60;
    var timer:Timer? = nil;
    
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var messageCode: UITextField!
    @IBOutlet weak var getPhoneCode: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "验证手机";
        setBackArrow(imageName: "ie_nav_back_arrow",position: IENavItem.Left);
    
        self.phoneNumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.phoneNumber.leftViewMode = UITextFieldViewMode.always;
        
        self.messageCode.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.messageCode.leftViewMode = UITextFieldViewMode.always;
        
        self.getPhoneCode.setLayer(cornerRadiu: 4, borderColor: UIColor.clear, width: 1);
        self.nextBtn.setLayer(cornerRadiu: 4, borderColor: UIColor.clear, width: 1);
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getPhoneCodeOnClick(_ sender: UIButton) {
        
        if (self.phoneNumber.text?.isEmpty)! {
            self.view.showTost(text: "请输入手机号码!");
            return;
        }
        if (!checkTelNumber(tel: self.phoneNumber.text! as NSString)) {
            self.view.showTost(text: "请输入正确的手机号码!");
            return;
        }
        
        SMSSDK.getVerificationCode(by: SMSGetCodeMethodSMS, phoneNumber: self.phoneNumber.text, zone: "86") { (error) in
            if(error == nil){
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeDown), userInfo: nil, repeats: true);
            }else{
                
                self.view.showTost(text: "发送失败!")
            }
        }
    }
    
    
    @IBAction func doNextAction(_ sender: UIButton) {
        if (self.phoneNumber.text?.isEmpty)! {
            self.view.showTost(text: "请输入手机号码!");
            return;
        }
        if (self.messageCode.text?.isEmpty)! {
            self.view.showTost(text: "请输入短信验证码!");
            return;
        }
        let param = NSMutableDictionary();
        param.setValue(self.createParam, forKey: "type");
        param.setValue(self.phoneNumber.text, forKey: "phone");
        SMSSDK.commitVerificationCode(self.messageCode.text, phoneNumber: self.phoneNumber.text, zone: "86") { (error) in
            if (error == nil){
                self.navigationController?.pushViewController(self.createViewController(_SBName: "IEMy", identifier: "IERegisterController", param: param), animated: true)
            }else{
                self.view.showTost(text: "短信验证码错误！");
            }
        }
    }
    
    
    
    func timeDown() -> Void {
        self.second -= 1;
        if self.second<=0 {
            self.getPhoneCode.backgroundColor = UIColor.white;
            self.getPhoneCode.isEnabled = true;
            self.second = 60;
            self.timer?.invalidate();
            self.timer = nil;
            self.getPhoneCode.setTitle("获取验证码", for: UIControlState.normal);
        }else{
            self.getPhoneCode.backgroundColor = RGBA(red: 225, green: 226, blue: 225, alpha: 1);
            self.getPhoneCode.isEnabled = false;
            self.getPhoneCode.setTitle(String(format:"%d秒后重发",self.second), for: UIControlState.normal);
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
