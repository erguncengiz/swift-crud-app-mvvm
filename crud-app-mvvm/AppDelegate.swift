//
//  AppDelegate.swift
//  crud-app-mvvm
//
//  Created by Ergün Yunus Cengiz on 7.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeStoryboard") as! HomeView
        viewController.viewModel = HomeViewModel()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}

