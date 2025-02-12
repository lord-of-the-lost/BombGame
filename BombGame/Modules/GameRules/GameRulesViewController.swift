//
//  GameRulesViewController.swift
//  BombGame
//
//  Created by Дарья on 10.02.2025.
//

import UIKit

class GameRulesViewController: UIViewController {
    
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
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var rules: [String] = [
        "Все игроки становятся в круг.",
        "Первый игрок берет телефон и нажимает кнопку:",
        "На экране появляется вопрос \"Назовите Фрукт\".",
        "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.",
        "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
        "Проигравшим считается тот, в чьих руках взорвалась бомба.",
        "Если выбран режим игры \"С Заданиями\", то проигравший выполняет задание."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - Private Methods
private extension GameRulesViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(rulesTitle)
        view.addSubview(mainStack)

        for (index, element) in rules.enumerated() {
            let number = String(index + 1)
            let name = element
            let rules = AvatarView(number: number, text: name)
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


final class AvatarView: UIView {

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 14.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ruleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(number: String, text: String) {
        super.init(frame: .zero)
        self.numberLabel.text = number
        self.ruleLabel.text = text
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(circleView)
        circleView.addSubview(numberLabel)
        addSubview(ruleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: 29),
            circleView.heightAnchor.constraint(equalToConstant: 29),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.topAnchor.constraint(equalTo: topAnchor),
            
            numberLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            
            ruleLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 8),
            ruleLabel.topAnchor.constraint(equalTo: topAnchor),
            ruleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            ruleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
