//
//  AppDelegate.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let appRouter = AppRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CategoryViewController()
        appRouter.navigationController
        appRouter.pushMainMenuViewController()
        window?.makeKeyAndVisible()

        return true
    }
}

