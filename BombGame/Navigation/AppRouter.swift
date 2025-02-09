//
//  AppRouter.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import UIKit

final class AppRouter {
    let navigationController = UINavigationController()
    
    func pushMainMenuViewController() {
        let mainMenuViewController = MainMenuFactory.makeModule(router: self)
        navigationController.pushViewController(mainMenuViewController, animated: true)
    }
    
    func popCurrentViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController.dismiss(animated: animated)
    }
}
