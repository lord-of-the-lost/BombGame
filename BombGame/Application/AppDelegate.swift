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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootViewController = SettingsViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
//        startMusic()
        return true
    }
}

// MARK: - Private Methods
private extension AppDelegate {
    func startMusic() {
        AudioPlayerService.shared.playSound(named: Sounds.Theme.one.rawValue, repeatable: true)
    }
}

