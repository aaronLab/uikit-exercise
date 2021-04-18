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
        static let landscape0 = UIImage(named: "landscape0")!
        static let landscape1 = UIImage(named: "landscape1")!
        static let landscape2 = UIImage(named: "landscape2")!
        static let landscape3 = UIImage(named: "landscape3")!
        static let landscape4 = UIImage(named: "landscape4")!
        static let portrait0 = UIImage(named: "portrait0")!
        static let portrait1 = UIImage(named: "portrait1")!
        static let portrait2 = UIImage(named: "portrait2")!
        static let portrait3 = UIImage(named: "portrait3")!
        static let portrait4 = UIImage(named: "portrait4")!
        
    }
    
}
