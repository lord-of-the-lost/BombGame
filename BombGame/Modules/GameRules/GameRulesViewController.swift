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
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // создать горизонтальный стэк
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .equalCentering
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
        imageView.alpha = 0.4
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var spacerView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addRules()
        setButtonConstr()
        setupConstraints()

    }
}

// MARK: - Private Methods
private extension GameRulesViewController {
    func setupView() {
        view.backgroundColor = Palette.mainSheetBg
        view.addSubview(backgroundImageView)
        view.addSubview(rulesTitle)
        view.addSubview(mainStack)
        
        view.addSubview(horizontalStack)
        view.bringSubviewToFront(horizontalStack)

    }
    
    func addRules() {
        for (index, element) in rules.enumerated() {
                let number = index + 1
                let alignment: NSTextAlignment = index == 1 ? .center : .left

                let ruleView: RuleView
                if index == rules.count - 1 {
                    let attributedText = makeAttributedString(from: element)
                    ruleView = RuleView(number: number, attributedText: attributedText, alignment: alignment)
                } else {
                    ruleView = RuleView(number: number, text: element, aligment: alignment)
                }
                
                mainStack.addArrangedSubview(ruleView)

                if index == 1 {
                    spacerView.translatesAutoresizingMaskIntoConstraints = false
                    spacerView.heightAnchor.constraint(equalToConstant: 35).isActive = true
                    mainStack.addArrangedSubview(spacerView)
                }
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
    
    func setButtonConstr() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: spacerView.topAnchor, constant: 3),
                horizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
                horizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
                horizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    func makeAttributedString(from text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let highlightText = "С Заданиями"
        
        if let range = text.range(of: highlightText) {
            let nsRange = NSRange(range, in: text)
            attributedString.addAttribute(.foregroundColor, value: UIColor.purple, range: nsRange)
            attributedString.addAttribute(.font, value: Fonts.display(size: 16).font, range: nsRange)
        }
        
        return attributedString
    }
}



