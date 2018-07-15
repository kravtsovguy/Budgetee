//
//  AppDelegate.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 28/05/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        self.window?.tintColor = .white
        self.window?.rootViewController = MainViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
}
