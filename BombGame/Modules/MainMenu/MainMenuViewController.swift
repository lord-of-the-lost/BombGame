//
//  MainMenuViewController.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import UIKit

final class MainMenuViewController: UIViewController {
    
    private lazy var gameTitle: UILabel = {
        let label = UILabel()
        label.text = "Бомба"
        label.font = Fonts.sfProRounded48
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: CommonButton = {
        let button = CommonButton (title: "Начать игру", backgroundColor: .red)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}


// MARK: - Private Methods
private extension MainMenuViewController {
    func setupView() {
        view.backgroundColor = Palette.mainBackground
        view.addSubview(gameTitle)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func startGame() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
        
    }
    
}





