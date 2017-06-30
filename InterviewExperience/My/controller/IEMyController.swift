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
        }
        return UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "inde");
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.navigationController?.pushViewController(self.createViewController(_SBName: "IEMy", identifier: "IELoginController", param: nil), animated: true);
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
