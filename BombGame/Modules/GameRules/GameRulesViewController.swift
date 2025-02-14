//
//  GameRulesViewController.swift
//  BombGame
//
//  Created by Дарья on 10.02.2025.
//

import UIKit

final class GameRulesViewController: UIViewController {
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.alignment = .top
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // создать горизонтальный стэк
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(button)
        return stack
    }()
    
    private lazy var rulesTitle: UILabel = {
        let title = UILabel()
        title.text = "Правила Игры"
        title.textColor = Palette.textPrimary
        title.font = Fonts.rounded(weight: 900 , size: 32).font
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var button: CommonButton = {
        let button = CommonButton(title: "Старт игры", backgroundColor: Palette.mainViewButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = Fonts.display(size: 12).font
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        button.layer.cornerRadius = 5
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: ImageResource.backgroundView)
        imageView.contentMode = .scaleToFill
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Palette.mainBackground
        imageView.alpha = 0.2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        addRules()
    }
}

// MARK: - Private Methods
private extension GameRulesViewController {
    func setupView() {
        view.backgroundColor = Palette.mainSheetBg
        view.addSubview(backgroundImageView)
        view.addSubview(rulesTitle)
        view.addSubview(mainStack)
//          view.addSubview(horizontalStack)
    }
    
    func addRules() {
        for (index, element) in rules.enumerated() {
            let number = index + 1
            let name = element
            let aligment: NSTextAlignment = index == 1 ? .center : .left
            let rules = RuleView(number: number, text: name, aligment: aligment)
            if index == 2 {
                mainStack.addArrangedSubview(horizontalStack)
            }
            mainStack.addArrangedSubview(rules)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rulesTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            mainStack.topAnchor.constraint(equalTo: rulesTitle.bottomAnchor, constant: 16),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
}



