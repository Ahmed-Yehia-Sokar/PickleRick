//
//  AppDelegate.swift
//  PickleRick
//
//  Created by Admin on 14/08/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - properties
    var window: UIWindow?
    
    // MARK: - methods
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
