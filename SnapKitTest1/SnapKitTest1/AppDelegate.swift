//
//  AppDelegate.swift
//  SnapKitTest1
//
//  Created by Aaron Lee on 2021-04-07.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = ViewController()
        
        window = UIWindow()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

}

