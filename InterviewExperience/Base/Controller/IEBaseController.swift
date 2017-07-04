//
//  IEBaseControllerViewController.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/21.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit


class IEBaseController: UIViewController {
    
    public var createParam:Any?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: RGBA(red: 47, green: 186, blue: 163, alpha: 1), size: CGSize(width: ScreenWidth, height: 64)), for: UIBarMetrics.default);

        self.navigationController?.navigationBar.titleTextAttributes = NSDictionary(object: UIColor.white, forKey: NSForegroundColorAttributeName as NSCopying) as? [String : Any];
        
    }
    
    func createViewController(_SBName:String,identifier:String,param:Any?) -> UIViewController{
        let storyboard = UIStoryboard(name: _SBName, bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:identifier);
        let baVc = vc as? IEBaseController;
        baVc?.createParam = param;
        return vc;
    }
    
    func setBackArrow(imageName:String,position:IENavItem) -> Void {
        let image = UIImage(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil);
        space.width = -5;
        if position==IENavItem.Left {
            let backBtn = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(doLeftAction(sender:)));
            self.navigationItem.leftBarButtonItems = [space,backBtn];
        }else{
            let backBtn = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(doRightAction(sender:)));
            self.navigationItem.rightBarButtonItems = [space,backBtn];
        }
    }

    
    func doLeftAction(sender:AnyObject) -> Void {
        self.navigationController?.popViewController(animated: true);
    }
    
    func doRightAction(sender:AnyObject) -> Void {
        self.navigationController?.popViewController(animated: true);
    }
    
    
    func setRightButtonByName(_name:NSString,_color:UIColor){
        let rightItem = UIBarButtonItem(customView:getNavButton(_name: _name, _color: _color, _align: false));
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil);
        space.width = -5;
        self.navigationItem.rightBarButtonItems = [space,rightItem];
    }
    
    func getNavButton(_name:NSString,_color:UIColor,_align:Bool) -> UIView{
        let size = getNewTextSize(_text: _name, _font: 14, _width: 100);
        let btn = UIButton(type: UIButtonType.custom);
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 44);
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        btn.setTitle(_name as String, for: UIControlState.normal);
        btn.setTitleColor(_color, for: UIControlState.normal);
        if (_align){
            btn.addTarget(self, action: #selector(doLeftAction(sender:)), for: UIControlEvents.touchUpInside);
        }else{
            btn.addTarget(self, action: #selector(doRightAction(sender:)), for: UIControlEvents.touchUpInside);
        }
        btn.titleEdgeInsets = UIEdgeInsetsMake(14, _align ? 0 :80-size.width, 14, _align ? 80-size.width : 0);
        return btn;
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
