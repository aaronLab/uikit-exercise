//
//  SocialCell - AppDelegate.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = ViewController()
        let navC = UINavigationController(rootViewController: vc)
        
        window = UIWindow()
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
        
        return true
    }


}

