//
//  IELoginController.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/22.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IELoginController: IEBaseController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var lognBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录";
        setBackArrow(imageName: "ie_nav_back_arrow",position: IENavItem.Left);
        
        self.userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.userName.leftViewMode = UITextFieldViewMode.always;
        
        self.passWord.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 44));
        self.passWord.leftViewMode = UITextFieldViewMode.always;
        
        self.lognBtn.setLayer(cornerRadiu: 4, borderColor:TinColor , width: 1);
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func loginBtnOnClick(_ sender: UIButton) {
        
    }
    
    @IBAction func registerNow(_ sender: UIButton) {
        self.navigationController?.pushViewController(self.createViewController(_SBName: "IEMy", identifier: "IEPhoneSureController",param: nil), animated: true)
    }
    
    @IBAction func forgetPass(_ sender: UIButton) {
        
        
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
