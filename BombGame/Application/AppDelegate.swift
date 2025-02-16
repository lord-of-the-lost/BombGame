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
        let rootViewController = MainMenuViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.overrideUserInterfaceStyle = .dark
        window?.makeKeyAndVisible()
        playThemeSound()
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        AudioPlayerService.shared.pause(type: .background)
        AudioPlayerService.shared.pause(type: .game)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        AudioPlayerService.shared.resume(type: .background)
    }
}

// MARK: - Private Methods
private extension AppDelegate {
    func playThemeSound() {
        AudioPlayerService.shared.playSound(
            named: DataService.shared.gameModel.settings.themeSound.rawValue,
            type: .background,
            repeatable: true
        )
    }
}
