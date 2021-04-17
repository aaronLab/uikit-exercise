//
//  AppDelegate.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/04/12.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = MainViewController()
        let navC = UINavigationController(rootViewController: vc)
        
        window = UIWindow()
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
        
        return true
    }

}

struct Shared {
    
    struct Images {
        
        static let sampleImage0 = UIImage(named: "sampleImage0")!
        static let sampleImage1 = UIImage(named: "sampleImage1")!
        static let sampleImage2 = UIImage(named: "sampleImage2")!
        
    }
    
}
