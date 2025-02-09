//
//  MainMenuFactory.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import UIKit

enum MainMenuFactory {
    static func makeModule(router: AppRouter) -> UIViewController {
        let presenter = MainMenuPresenter(router: router)
        let viewController = MainMenuViewController(presenter: presenter)
        presenter.setupView(viewController)
        return viewController
    }
}
