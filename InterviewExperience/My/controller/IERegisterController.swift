//
//  IERegisterController.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/22.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IERegisterController: IEBaseController {
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var surePass: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.userName.leftViewMode = UITextFieldViewMode.always;
        
        self.surePass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.surePass.leftViewMode = UITextFieldViewMode.always;
        
        self.passWord.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.passWord.leftViewMode = UITextFieldViewMode.always;
        
        self.registerBtn.setLayer(cornerRadiu: 4, borderColor: UIColor.clear, width: 1);
        
        self.title = "注册";
        setBackArrow(imageName: "ie_nav_back_arrow",position: IENavItem.Left);
        
        print(self.params!);
        
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func registerAction(_ sender: UIButton) {
        if (self.userName.text?.isEmpty)! {
            hudShowText(message: "请输入用户名!");
            return;
        }
        if (self.passWord.text?.isEmpty)! {
            hudShowText(message: "请输入密码!");
            return;
        }
        if (self.surePass.text?.isEmpty)! {
            hudShowText(message: "请确认密码!");
            return;
        }
        if ((self.passWord.text?.caseInsensitiveCompare(self.surePass.text!)) != ComparisonResult.orderedSame) {
            hudShowText(message: "两次密码输入不一致!");
            return;
        }
        
        let requestParams = NSMutableDictionary();
        requestParams.setValue(self.params, forKey: "phone");
        requestParams.setValue(self.userName.text, forKey: "userName");
        requestParams.setValue(self.passWord.text, forKey: "passWord");
        IEHttpManager.dataRquest(url: "register", params: requestParams, hudShow: true, method: IEHttpMethod.POST, success: { (data:Any?) in
            hudShowText(message: "注册成功!");
            self.perform(#selector(self.popToLogin), with: nil, afterDelay: 1.5);
        }) { (error:Error?) in
            
        }
    }
    
    
    func popToLogin() -> Void {
        for con:UIViewController in (self.navigationController?.childViewControllers)! {
            if con.isKind(of: IELoginController.self) {
                self.navigationController?.popToViewController(con, animated: true);
            }
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
