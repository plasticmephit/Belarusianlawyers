//
//  AppDelegate.swift
//  Belarusianlawyers
//
//  Created by Maksimilian on 9.08.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        
        
        window.rootViewController = TabBar()
        
        window.makeKeyAndVisible()
        self.window = window
        NetworkMonitor.shared.startMonitoring()
        return true
    }
    
    
}

// MARK: UISceneSession Lifecycle






