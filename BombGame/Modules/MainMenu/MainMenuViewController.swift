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
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
}
