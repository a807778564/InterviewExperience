//
//  IEHttpManager.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/27.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

enum IEHttpMethod:Int {
    case GET
    case POST
}

class IEHttpManager: NSObject {
    static let baseUrl:String = "http://172.16.213.125:8000/IEServices/"
    
    static let ieNet = IENetWorkRequest.shareInstance;
    
    class func dataRquest(url:String!,params:NSMutableDictionary,hudShow:Bool,method:IEHttpMethod,success:@escaping (Any?)->Void,error:@escaping (Error?)->Void) -> Void {
        if hudShow {
            hudShowLoading();
        }
        if method==IEHttpMethod.GET {
            ieNet.requestWithGet(param: params, url: baseUrl+url, success: { (data:AnyObject?) in
                success(data?.value(forKey: "data"));
            }, errorBlock: { (err:Error?) in
                error(err)
            })
        }else{
            ieNet.requestWithPost(param: params, url: baseUrl+url, success: { (data:AnyObject?) in
                success(data?.value(forKey: "data"));
            }, errorBlock: { (err:Error?) in
                error(err)
            })
        }
    }
}
