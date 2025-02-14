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
        imageView.image = UIImage(named: "backgroundView")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settingsIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var questionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "questionIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(category), for: .touchUpInside)
        return button
    }()
    
    private lazy var gameDescription: UILabel = {
        let label = UILabel()
        label.text = "ИГРА ДЛЯ КОМПАНИИ"
        label.font = Fonts.rounded(weight: 500, size: 28).font
        label.textColor = UIColor(named: "TextPrimary")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var gameTitle: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.font = Fonts.rounded(weight: 900, size: 48).font
        label.textColor = UIColor(named: "TextPrimary")
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
    
    //Цвет кнопки поменять
    private lazy var startButton: CommonButton = {
        let button = CommonButton(title: "Старт игры", backgroundColor: UIColor(named: "MainViewButton") ?? .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        return button
    }()
    
    //Цвет кнопки поменять
    //Действие поменять
    
    private lazy var categoryButton: CommonButton = {
        let button = CommonButton(title: "Категории", backgroundColor: UIColor(named: "MainViewButton") ?? .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(category), for: .touchUpInside)
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
        view.addSubview(backgroundView)
        view.addSubview(settingsButton)
        view.addSubview(questionButton)
        view.addSubview(gameDescription)
        view.addSubview(gameTitle)
        view.addSubview(bombImageView)
        view.addSubview(startButton)
        view.addSubview(categoryButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),

            settingsButton.heightAnchor.constraint(equalToConstant: 35),
            settingsButton.widthAnchor.constraint(equalToConstant: 35),
            settingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
            settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            
            questionButton.heightAnchor.constraint(equalToConstant: 35),
            questionButton.widthAnchor.constraint(equalToConstant: 35),
            questionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -37),
            questionButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            
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
    
    
    @objc func startGame() {
        let controller = GameViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
    
    
    @objc func category() {
        let controller = CategoryViewController()
        controller.view.backgroundColor = .white
        present(controller, animated: true)
    }
    
}

