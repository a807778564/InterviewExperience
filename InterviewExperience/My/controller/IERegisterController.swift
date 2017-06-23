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
        
        self.registerBtn.setLayer(cornerRadiu: 4, borderColor: TinColor, width: 1);
        
        self.title = "注册";
        setBackArrow(imageName: "ie_nav_back_arrow",position: IENavItem.Left);
        
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func registerAction(_ sender: UIButton) {
        
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
