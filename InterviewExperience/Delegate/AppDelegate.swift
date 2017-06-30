//
//  AppDelegate.swift
//  InterviewExperience
//
//  Created by huangrensheng on 2017/6/21.
//  Copyright © 2017年 note. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    class func shareDelegate() ->AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate;
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds);
        let tabController = UITabBarController();
        //tab 背景
        let tabBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 49));
        tabBackgroundView.backgroundColor = UIColor.white;
        tabController.tabBar.insertSubview(tabBackgroundView, at: 0);
        tabController.viewControllers = initChilControllers() as? [UIViewController];
        tabController.tabBar.tintColor = RGBA(red: 47,green: 186,blue: 163,alpha: 1);
        self.window?.rootViewController = tabController;
        self.window?.makeKeyAndVisible();
        return true
    }
    
    func initChilControllers() -> NSMutableArray {
        let controllers = NSMutableArray();
        let main = IEMainController();
        controllers.add(UINavigationController(rootViewController: main));
        main.tabBarItem = UITabBarItem(title:"大厅", image: UIImage(named:"ie_tabbar_main_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named:"ie_tabbar_main_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal));
        main.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
        
        let talk = IETalkController();
        controllers.add(UINavigationController(rootViewController: talk));
        talk.tabBarItem = UITabBarItem(title:"话题", image: UIImage(named:"ie_tabbar_message_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named:"ie_tabbar_message_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal));
        talk.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
        
        let message = IEMessageController();
        controllers.add(UINavigationController(rootViewController: message));
        message.tabBarItem = UITabBarItem(title:"消息", image: UIImage(named:"ie_tabbar_push_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named:"ie_tabbar_push_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal));
        message.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
        
        let my = IEMyController();
        controllers.add(UINavigationController(rootViewController: my));
        my.tabBarItem = UITabBarItem(title:"我", image: UIImage(named:"ie_tabbar_my_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named:"ie_tabbar_my_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal));
        my.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
        
        let tabbar = UITabBar.appearance();
        tabbar.backgroundImage = UIImage();
        tabbar.shadowImage = UIImage.imageWithColor(color: BackColor, size: CGSize(width: ScreenWidth, height: 1));
        
        return controllers;
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

