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
    
    private lazy var rulesTitle: UILabel = {
        let title = UILabel()
        title.text = "Правила Игры"
//        title.textColor = Palette.textPrimary
        title.font = Fonts.rounded(weight: 900 , size: 32).font
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
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
//        view.backgroundColor = Palette.mainSheetBg
        view.addSubview(rulesTitle)
        view.addSubview(mainStack)
    }
    
    func addRules() {
        for (index, element) in rules.enumerated() {
            let number = String(index + 1)
            let name = element
            let rules = RuleView(number: number, text: name)
            mainStack.addArrangedSubview(rules)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rulesTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            mainStack.topAnchor.constraint(equalTo: rulesTitle.bottomAnchor, constant: 16),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
        ])
    }
}



