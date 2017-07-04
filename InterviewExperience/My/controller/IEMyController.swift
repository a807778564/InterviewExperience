//
//  IEMyController.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/21.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit
import Masonry

class IEMyController: IEBaseController,UITableViewDelegate,UITableViewDataSource {
    
    var myTable = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped);
    var userInfo:IEUserModel? = nil;
    let oneArray = NSArray(objects:"保密经验","经验收藏","话题收藏","分享APP","清除缓存","意见反馈");
    let twoArray = NSArray(objects:"ie_my_private","ie_my_collection","ie_my_talk","ie_my_share","ie_my_clear","ie_my_feedback");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BackColor;
        self.title = "我";
        
        self.myTable.separatorStyle = UITableViewCellSeparatorStyle.none;
        self.myTable.delegate = self;
        self.myTable.dataSource = self;
        self.myTable.backgroundColor = BackColor;
        self.view.addSubview(self.myTable);
        self.myTable.mas_makeConstraints { (make) in
            make?.edges.equalTo()(self.view);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        if (userInfo==nil && UserDefaults.standard.value(forKey: "token") != nil){
            IEHttpManager.dataRquest(url: "userInfo", params: NSMutableDictionary(), hudShow: true, method: IEHttpMethod.POST, success: { (data:Any?) in
                self.userInfo = try!IEUserModel(dictionary: data as! [AnyHashable : Any]);
                self.myTable.reloadData();
            }, error: { (error:Error?) in
                
            })
        }else if(UserDefaults.standard.value(forKey: "token") == nil){
            userInfo = nil;
            self.myTable.reloadData();
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return 1;
        }
        return 3;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 65;
        }
        return 44;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section==0 {
            var cell:IEMyLoginCell? = tableView.dequeueReusableCell(withIdentifier: "IELoginCell") as? IEMyLoginCell;
            if (cell == nil) {
                cell = IEMyLoginCell(style: UITableViewCellStyle.default, reuseIdentifier: "IELoginCell");
            }
            cell?.userInfo = self.userInfo;
            return cell!;
        }else{//else if(indexPath.section==1)
            var cell:IEMyNormalCell? = tableView.dequeueReusableCell(withIdentifier: "IEMyNormalCell") as? IEMyNormalCell;
            if (cell == nil) {
                cell = IEMyNormalCell(style: UITableViewCellStyle.default, reuseIdentifier: "IEMyNormalCell");
            }
            if indexPath.section==1{
                cell?.setTitleAndIcon(icon: twoArray[indexPath.row] as! String, title: oneArray[indexPath.row] as! String);
            }else{
                cell?.setTitleAndIcon(icon: twoArray[indexPath.row+3] as! String, title: oneArray[indexPath.row+3] as! String);
            }
            return cell!;
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0){
            if(UserDefaults.standard.value(forKey: "token") == nil){
                self.navigationController?.pushViewController(self.createViewController(_SBName: "IEMy", identifier: "IELoginController", param: nil), animated: true);
            }else{
                self.navigationController?.pushViewController(self.createViewController(_SBName: "IEMy", identifier: "IESettingController", param: nil), animated: true);
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 20;
        }
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
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
