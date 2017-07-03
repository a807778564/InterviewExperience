//
//  IENetWorkRequest.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/27.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit
import AFNetworking

class IENetWorkRequest: NSObject {
    
    private static let single = IENetWorkRequest();

    static var shareInstance:IENetWorkRequest{//单例方法
        return single;
    }
    
    private override init() {};//禁止外部实例化
    
    public func requestWithGet(param:NSMutableDictionary,url:String,success:@escaping (AnyObject?) ->Void,errorBlock:@escaping (Error?) ->Void) -> Void {
        let appendUrl = getUrlWithParam(param: param, url: url);
        let requestUrl = NSURL(string: appendUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!);
        let request = NSURLRequest(url: requestUrl! as URL, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60.0);
        let sess = URLSession.shared;
        let task = sess.dataTask(with: request as URLRequest) { (data:Data?, response:URLResponse?, error:Error?) in
            DispatchQueue.main.async(execute: {
                if(data==nil){
                    hudHidden();
                    hudShowText(message: "请求失败");
                    errorBlock(error)
                    return;
                }
                let datastring: String = String(data:data!, encoding:String.Encoding.utf8)!
                let jsonData = datastring.replacingOccurrences(of: "null", with: "\"\"");//JSONSerialization 不能解析null 替换null为“”字符串
                let dataJson = jsonData.data(using: String.Encoding.utf8);
                
                print("response:"+String(data:dataJson!, encoding:String.Encoding.utf8)!);
                
                if(String(data:dataJson!, encoding:String.Encoding.utf8)!.hasPrefix("{")||String(data:dataJson!, encoding:String.Encoding.utf8)!.hasPrefix("[")){
                    let dict = try! JSONSerialization.jsonObject(with: dataJson!, options: JSONSerialization.ReadingOptions.mutableLeaves)
                    if(((dict as AnyObject).value(forKey: "code") as AnyObject).integerValue == 1){
                        success(dict as AnyObject)
                    }else{
                        if(((dict as AnyObject).value(forKey: "code") as AnyObject).integerValue == 0){
                            hudHidden();
                            hudShowText(message: (dict as AnyObject).value(forKey: "message") as! String);
                        }
                        errorBlock(error)
                    }
                }else{
                    hudShowText(message: "请求失败");
                    errorBlock(error)
                }
            })
        }
        task.resume();
    }
    
    private func getUrlWithParam(param:NSMutableDictionary,url:String) -> String {
        var getUrl = url;
        if param.allKeys.count<=0 {
            if (UserDefaults.standard.value(forKey: "token") != nil) {
                getUrl += "?token="+String(describing: UserDefaults.standard.value(forKey: "token")!)
            }
            return getUrl;
        }
        
        for i in 0...param.allKeys.count-1 {
            var key:String!;
            key = param.allKeys[i] as! String;
            if i==0 {
                getUrl += "?"+key+"="+String(describing: param.value(forKey: key)!)
            }else{
                if ((param.value(forKey: key) as! String).isEqual("")) {
                    continue;
                }
                getUrl += "&"+key+"="+String(describing: param.value(forKey: key)!)
            }
            if (UserDefaults.standard.value(forKey: "token") != nil) {
                getUrl += "&token="+String(describing: UserDefaults.standard.value(forKey: "token")!)
            }
        }
        return getUrl;
    }
    
    
    public func requestWithPost(param:NSMutableDictionary,url:String,success:@escaping (AnyObject?) ->Void,errorBlock:@escaping (Error?) ->Void) -> Void {
        let session = URLSession.shared;
        let request = NSMutableURLRequest(url:URL(string: url)!);
        request.httpMethod = "POST";
        request.timeoutInterval = 60;
        request.httpBody = postBody(params: param);
        let  task = session.dataTask(with:request as URLRequest) { (data:Data?, response:URLResponse?,error:Error?) in
            DispatchQueue.main.async(execute: {
                if(data==nil){
                    hudHidden();
                    hudShowText(message: "请求失败");
                    errorBlock(error)
                    return;
                }
                let datastring: String = String(data:data!, encoding:String.Encoding.utf8)!
                let jsonData = datastring.replacingOccurrences(of: "null", with: "\"\"");//JSONSerialization 不能解析null 替换null为“”字符串
                let dataJson = jsonData.data(using: String.Encoding.utf8);
                
                print("response:"+String(data:dataJson!, encoding:String.Encoding.utf8)!);
                
                if(String(data:dataJson!, encoding:String.Encoding.utf8)!.hasPrefix("{")||String(data:dataJson!, encoding:String.Encoding.utf8)!.hasPrefix("[")){
                    let dict = try! JSONSerialization.jsonObject(with: dataJson!, options: JSONSerialization.ReadingOptions.mutableLeaves)
                    if(((dict as AnyObject).value(forKey: "code") as AnyObject).integerValue == 1){
                        success(dict as AnyObject)
                    }else{
                        if(((dict as AnyObject).value(forKey: "code") as AnyObject).integerValue == 0){
                            hudHidden();
                            hudShowText(message: (dict as AnyObject).value(forKey: "message") as! String);
                        }
                        errorBlock(error)
                    }
                }else{
                    hudShowText(message: "请求失败");
                    errorBlock(error)
                }

//                let datastring: String = String(data:data!, encoding:String.Encoding.utf8)!
//                
//                let jsonData = datastring.replacingOccurrences(of: "(", with: "");
//                let json = jsonData.replacingOccurrences(of: ")", with: "")
//                let dict = try! JSONSerialization.jsonObject(with: json.data(using: String.Encoding.utf8)!,options: JSONSerialization.ReadingOptions.mutableContainers)
//                print(dict)
//                if(!(dict as AnyObject).isEqual(nil)){
//                    success(dict)
//                }else{
//                    errorBlock(error)
//                }
            })
        }
        task.resume()
    }
    
    
    private func postBody(params:NSMutableDictionary) ->Data?{
        var body = "";
        if params.allKeys.count<=0 {
            if (UserDefaults.standard.value(forKey: "token") != nil) {
                body += "&token="+String(describing: UserDefaults.standard.value(forKey: "token")!)
            }
            return body.data(using: String.Encoding.utf8);
        }
        for i in 0...params.allKeys.count-1 {
            var key:String!;
            key = params.allKeys[i] as! String;
            if ((params.value(forKey: key) as! String).isEqual("")) {
                continue;
            }
            if i==0 {
                body += key+"="+String(describing: params.value(forKey: key)!)
            }else{
                if ((params.value(forKey: key) as! String).isEqual("")) {
                    continue;
                }
                body += "&"+key+"="+String(describing: params.value(forKey: key)!)
            }
            if (UserDefaults.standard.value(forKey: "token") != nil) {
                body += "&token="+String(describing: UserDefaults.standard.value(forKey: "token")!)
            }
            
        }
        return body.data(using: String.Encoding.utf8);
    }

}
