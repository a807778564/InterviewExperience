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
        
        self.getPhoneCode.setLayer(cornerRadiu: 4, borderColor: UIColor.white, width: 1);
        self.nextBtn.setLayer(cornerRadiu: 4, borderColor: TinColor, width: 1);
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
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeDown), userInfo: nil, repeats: true);
        
        SMSSDK.getVerificationCode(by: SMSGetCodeMethodSMS, phoneNumber: self.phoneNumber.text, zone: "86") { (error) in
            if(error == nil){
                print("发送成功");
            }else{
                print("发送失败");
            }
        }
    }
    
    
    @IBAction func doNextAction(_ sender: UIButton) {
        if (self.phoneNumber.text?.isEmpty)! {
            self.view.showTost(text: "手机号码不能为空!");
            return;
        }
        if (self.messageCode.text?.isEmpty)! {
            self.view.showTost(text: "请输入短信验证码!");
            return;
        }
        
        SMSSDK.commitVerificationCode(self.messageCode.text, phoneNumber: self.phoneNumber.text, zone: "86") { (error) in
            if (error == nil){
                print("验证成功");
//                self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
            }else{
                print("验证失败");
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
