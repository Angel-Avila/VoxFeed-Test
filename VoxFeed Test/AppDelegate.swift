//
//  AppDelegate.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/20/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigator: Navigator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        navigator = Navigator(provider: DefaultComponentProvider())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigator?.getRoot()
        window?.makeKeyAndVisible()
        
        overrideAppearance()
        
        return true
    }

    fileprivate func overrideAppearance() {
        UINavigationBar.appearance().tintColor = .voxFeedBlue
        UINavigationBar.appearance().barTintColor = .white
        //UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.textColor]
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
