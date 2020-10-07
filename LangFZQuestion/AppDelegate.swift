//
//  AppDelegate.swift
//  LangFZQuestion
//
//  Created by LFZ on 2020/10/7.
//  Copyright © 2020 LFZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = ViewController.init()
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

