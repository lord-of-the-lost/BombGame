//
//  RuleView.swift
//  BombGame
//
//  Created by Дарья on 13.02.2025.
//

import UIKit
final class RuleView: UIView {
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.rounded(weight: 2, size: 16).font
        label.textColor = Palette.textPrimary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = Palette.mainBackground
        view.layer.cornerRadius = 14.5
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ruleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.display(size: 16).font
        label.textColor = .textPrimary
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
    
}
    // MARK: - Private Methods
    private extension RuleView {
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
