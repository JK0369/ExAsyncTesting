//
//  AppDelegate.swift
//  ExAsyncRx
//
//  Created by 김종권 on 2022/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let viewController = ViewController()
        viewController.reactor = .init()
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        return true
    }
}
