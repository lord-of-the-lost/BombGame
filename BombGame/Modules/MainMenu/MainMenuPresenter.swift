//
//  MainMenuPresenter.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import Foundation

// MARK: - Protocols
protocol MainMenuViewProtocol: AnyObject {
    
}

protocol MainMenuPresenterProtocol: AnyObject {
    func setupView(_ view: MainMenuViewProtocol)
    func settingsButtonTapped()
    func helpButtonTapped()
    func startGameButtonTapped()
    func setCategoriesButtonTapped()
}

// MARK: - Presenter
final class MainMenuPresenter: MainMenuPresenterProtocol {
    private weak var view: MainMenuViewProtocol?
    private let router: AppRouter
    
    init(router: AppRouter) {
        self.router = router
    }
    
    func setupView(_ view: MainMenuViewProtocol) {
        self.view = view
    }
    
    func settingsButtonTapped() {
        
    }
    
    func helpButtonTapped() {
        
    }
    
    func startGameButtonTapped() {
        
    }
    
    func setCategoriesButtonTapped() {
        
    }
}

// MARK: - Private Methods
private extension MainMenuPresenter {
  
}
