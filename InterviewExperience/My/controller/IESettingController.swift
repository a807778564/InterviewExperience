//
//  IESettingController.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/7/3.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

class IESettingController: IEBaseController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var settingTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackArrow(imageName: "ie_nav_back_arrow",position: IENavItem.Left);
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 84;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let fotter = UIView();
        let loginOut = UIButton(type: UIButtonType.custom);
        loginOut.addTarget(self, action: #selector(loginOutOnClick), for: UIControlEvents.touchUpInside);
        loginOut.setTitle("退出登录", for: UIControlState.normal);
        loginOut.setTitleColor(UIColor.white, for: UIControlState.normal);
        loginOut.backgroundColor = RGBA(red: 214, green: 53, blue: 73, alpha: 1);
        loginOut.setLayer(cornerRadiu: 4.0, borderColor: UIColor.clear, width: 1);
        fotter.addSubview(loginOut)
        loginOut.mas_makeConstraints { (make) in
            make?.leading.equalTo()(fotter.mas_leading)?.offset()(16);
            make?.trailing.equalTo()(fotter.mas_trailing)?.offset()(-16);
            make?.centerY.equalTo()(fotter.mas_centerY);
            make?.height.offset()(44)
        }
        return fotter;
    }
    
    func loginOutOnClick() -> Void {
        let params = NSMutableDictionary();
        params.setValue(String(describing: UserDefaults.standard.value(forKey: "token")!), forKey: "token");
        IEHttpManager.dataRquest(url: "loginOut", params: params, hudShow: true, method: IEHttpMethod.POST, success: { (data:Any?) in
            UserDefaults.standard.removeObject(forKey: "token");
            self.navigationController?.popViewController(animated: true);
        }) { (error:Error?) in
            
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
