//
//  MainMenuViewController.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import UIKit

final class MainMenuViewController: UIViewController {
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .backgroundView).withTintColor(.textureStroke, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(frame: .init(x: 0, y: 0, width: 35, height: 35))
        button.setBackgroundImage(UIImage(resource: .settingsIcon), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var helpButton: UIButton = {
        let button = UIButton(frame: .init(x: 0, y: 0, width: 35, height: 35))
        button.setBackgroundImage(UIImage(resource: .questionIcon), for: .normal)
        button.addTarget(self, action: #selector(helpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var gameDescription: UILabel = {
        let label = UILabel()
        label.text = "ИГРА ДЛЯ КОМПАНИИ"
        label.font = Fonts.rounded(weight: 500, size: 28).font
        label.textColor = Palette.textPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var gameTitle: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.font = Fonts.rounded(weight: 900, size: 48).font
        label.textColor = Palette.textPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bomb")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var startButton: CommonButton = {
        let button = CommonButton(title: "Старт игры", backgroundColor: UIColor(named: "MainViewButton") ?? .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        return button
    }()
    
    private lazy var categoryButton: CommonButton = {
        let button = CommonButton(title: "Категории", backgroundColor: UIColor(named: "MainViewButton") ?? .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupConstraints()
    }
}


// MARK: - Private Methods
private extension MainMenuViewController {
    func setupView() {
        view.backgroundColor = Palette.mainBackground
        view.addSubview(backgroundView)
        view.addSubview(gameDescription)
        view.addSubview(gameTitle)
        view.addSubview(bombImageView)
        view.addSubview(startButton)
        view.addSubview(categoryButton)
    }
    
    func setupNavigationBar() {
        let settingsButton = UIBarButtonItem(customView: settingsButton)
        let helpButton = UIBarButtonItem(customView: helpButton)
        
        navigationItem.leftBarButtonItem = settingsButton
        navigationItem.rightBarButtonItem = helpButton
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            gameDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 126),
            
            gameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameTitle.topAnchor.constraint(equalTo: gameDescription.bottomAnchor, constant: 2),
            
            bombImageView.heightAnchor.constraint(equalToConstant: 300),
            bombImageView.widthAnchor.constraint(equalToConstant: 275),
            bombImageView.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 30),
            bombImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startButton.heightAnchor.constraint(equalToConstant: 60),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.bottomAnchor.constraint(equalTo: categoryButton.topAnchor, constant: -19),
            
            categoryButton.heightAnchor.constraint(equalToConstant: 60),
            categoryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
        ])
    }
    
    
    @objc func startGameButtonTapped() {
        let controller = GameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func categoryButtonTapped() {
        let controller = CategoryViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func settingsButtonTapped() {
        let controller = SettingsViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func helpButtonTapped() {
        let modalViewController = GameRulesViewController()
        
        if let sheet = modalViewController.sheetPresentationController {
            sheet.detents = [.custom { _ in UIScreen.main.bounds.height * 0.75 }]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        present(modalViewController, animated: true)
    }
}
