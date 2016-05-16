//
//  AppDelegate.swift
//  3DTouch
//
//  Created by SnowCheng on 16/5/15.
//  Copyright © 2016年 SnowCheng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let itemIcon1 = UIApplicationShortcutIcon.init(templateImageName: "AIcon")
        let item1 = UIApplicationShortcutItem.init(type: "type1", localizedTitle: "title1", localizedSubtitle: "subTitle1", icon: itemIcon1, userInfo: nil)
        
        let itemIcon2 = UIApplicationShortcutIcon.init(templateImageName: "rightIcon")
        let item2 = UIApplicationShortcutItem.init(type: "type2", localizedTitle: "title2", localizedSubtitle: "subTitle2", icon: itemIcon2, userInfo: nil)
        
        let itemIcon3 = UIApplicationShortcutIcon.init(type: .Add)
        let item3 = UIApplicationShortcutItem.init(type: "type3", localizedTitle: "title3", localizedSubtitle: "subTitle3", icon: itemIcon3, userInfo: nil)
        
        let itemIcon4 = UIApplicationShortcutIcon.init(type: .Alarm)
        let item4 = UIApplicationShortcutItem.init(type: "type4", localizedTitle: "title4", localizedSubtitle: "subTitle4", icon: itemIcon4, userInfo: nil)
        
        UIApplication.sharedApplication().shortcutItems = [item1, item2, item3, item4]
        
        return true
    }

    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        switch shortcutItem.type {
        case "type1":
            print("type1__3DTouch")
        default:
            let alertVC = UIAlertController.init(title: "你好", message: "3DTouch", preferredStyle: UIAlertControllerStyle.Alert)
            let act1 = UIAlertAction.init(title: "cirtain", style: UIAlertActionStyle.Destructive, handler: { (_) in })
            
            alertVC.addAction(act1)
            
            window?.rootViewController?.presentViewController(alertVC, animated: true, completion: nil)
        }
    }

}

