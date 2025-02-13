//
//  SettingsViewController.swift
//  BombGame
//
//  Created by Anna Melekhina on 13.02.2025.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var firstView: RoundedView = {
        let view = RoundedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CategoryCellBg")
        return view
    }()
    
    private lazy var secView: RoundedView = {
        let view = RoundedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CategoryCellBg")
        return view
    }()
    
    private lazy var thirdView: RoundedView = {
        let view = RoundedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CategoryCellBg")
        return view
    }()
    
    private lazy var shortButton = createButton(title: "Короткое")
    private lazy var mediumButton = createButton(title: "Среднее")
    private lazy var longButton = createButton(title: "Длинное")
    private lazy var randomButton = createButton(title: "Случайное")
    
    private lazy var musicLabel = createLabel(text: "Фоновая музыка")
    private lazy var tickingLabel = createLabel(text: "Тикание бомбы")
    private lazy var explosionLabel = createLabel(text: "Взрыв бомбы")
    
    private lazy var musicValueLabel = createValueLabel(text: "Мелодия 1")
    private lazy var tickingValueLabel = createValueLabel(text: "Часы 2")
    private lazy var explosionValueLabel = createValueLabel(text: "Взрыв 1")
    
    private lazy var vibrationLabel = createLabel(text: "Вибрация")
    private lazy var gameWithTasksLabel = createLabel(text: "Игра с заданиями")
    
    private lazy var vibrationSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.translatesAutoresizingMaskIntoConstraints = false

        return toggle
    }()
    
    private lazy var gameWithTasksSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.translatesAutoresizingMaskIntoConstraints = false

        return toggle
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundView")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
    }
    
}

private extension SettingsViewController {
    func addActions() {
      
    }
    
    func setupUI() {
        title = "Настройки"
        view.backgroundColor = UIColor(named: "MainSheetBg")
   
           view.addSubview(backgroundImage)
        
        view.addSubview(firstView)
        view.addSubview(secView)
        view.addSubview(thirdView)
        
        firstView.addSubview(shortButton)
        firstView.addSubview(mediumButton)
        firstView.addSubview(longButton)
        firstView.addSubview(randomButton)
        
        secView.addSubview(musicLabel)
        secView.addSubview(musicValueLabel)
        secView.addSubview(tickingLabel)
        secView.addSubview(tickingValueLabel)
        secView.addSubview(explosionLabel)
        secView.addSubview(explosionValueLabel)
        
        thirdView.addSubview(vibrationLabel)
        thirdView.addSubview(vibrationSwitch)
        thirdView.addSubview(gameWithTasksLabel)
        thirdView.addSubview(gameWithTasksSwitch)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstView.heightAnchor.constraint(equalToConstant: 100),
            
            shortButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 16),
            shortButton.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 16),
            
            mediumButton.leadingAnchor.constraint(equalTo: shortButton.trailingAnchor, constant: 10),
            mediumButton.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 16),
            
            longButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 16),
            longButton.topAnchor.constraint(equalTo: shortButton.bottomAnchor, constant: 10),
            
            randomButton.leadingAnchor.constraint(equalTo: longButton.trailingAnchor, constant: 10),
            randomButton.topAnchor.constraint(equalTo: mediumButton.bottomAnchor, constant: 10),
            
            secView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 16),
            secView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secView.heightAnchor.constraint(equalToConstant: 140),
            
            musicLabel.leadingAnchor.constraint(equalTo: secView.leadingAnchor, constant: 16),
            musicLabel.topAnchor.constraint(equalTo: secView.topAnchor, constant: 16),
            
            musicValueLabel.trailingAnchor.constraint(equalTo: secView.trailingAnchor, constant: -16),
            musicValueLabel.centerYAnchor.constraint(equalTo: musicLabel.centerYAnchor),
            
            tickingLabel.leadingAnchor.constraint(equalTo: secView.leadingAnchor, constant: 16),
            tickingLabel.topAnchor.constraint(equalTo: musicLabel.bottomAnchor, constant: 10),
            
            tickingValueLabel.trailingAnchor.constraint(equalTo: secView.trailingAnchor, constant: -16),
            tickingValueLabel.centerYAnchor.constraint(equalTo: tickingLabel.centerYAnchor),
            
            explosionLabel.leadingAnchor.constraint(equalTo: secView.leadingAnchor, constant: 16),
            explosionLabel.topAnchor.constraint(equalTo: tickingLabel.bottomAnchor, constant: 10),
            
            explosionValueLabel.trailingAnchor.constraint(equalTo: secView.trailingAnchor, constant: -16),
            explosionValueLabel.centerYAnchor.constraint(equalTo: explosionLabel.centerYAnchor),
            
            thirdView.topAnchor.constraint(equalTo: secView.bottomAnchor, constant: 16),
            thirdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thirdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thirdView.heightAnchor.constraint(equalToConstant: 100),
            
            vibrationLabel.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 16),
            vibrationLabel.topAnchor.constraint(equalTo: thirdView.topAnchor, constant: 16),
            
            vibrationSwitch.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -16),
            vibrationSwitch.centerYAnchor.constraint(equalTo: vibrationLabel.centerYAnchor),
            
            gameWithTasksLabel.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 16),
            gameWithTasksLabel.topAnchor.constraint(equalTo: vibrationLabel.bottomAnchor, constant: 16),
            
            gameWithTasksSwitch.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -16),
            gameWithTasksSwitch.centerYAnchor.constraint(equalTo: gameWithTasksLabel.centerYAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
                   backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "TextPrimary")
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(chooseLength(sender:)), for: .touchUpInside)
        return button
    }
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createValueLabel(text: String) -> UILabel {
        let label = createLabel(text: text)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    @objc func chooseLength(sender: UIButton) {
        shortButton.isSelected = false
        mediumButton.isSelected = false
        longButton.isSelected = false
        randomButton.isSelected = false
        
        sender.isSelected = true
        sender.backgroundColor = sender.isSelected ? UIColor(named: "GameViewButton") : UIColor(named: "TextPrimary")
        
        switch sender {
        case shortButton:
            
            mediumButton.backgroundColor = UIColor(named: "TextPrimary")
            randomButton.backgroundColor = UIColor(named: "TextPrimary")
            longButton.backgroundColor = UIColor(named: "TextPrimary")
            
        case mediumButton:
            
            shortButton.backgroundColor = UIColor(named: "TextPrimary")
            randomButton.backgroundColor = UIColor(named: "TextPrimary")
            longButton.backgroundColor = UIColor(named: "TextPrimary")
            
            
        case longButton:
            
            mediumButton.backgroundColor = UIColor(named: "TextPrimary")
            shortButton.backgroundColor = UIColor(named: "TextPrimary")
            randomButton.backgroundColor = UIColor(named: "TextPrimary")
            
            
        default:
            mediumButton.backgroundColor = UIColor(named: "TextPrimary")
            shortButton.backgroundColor = UIColor(named: "TextPrimary")
            longButton.backgroundColor = UIColor(named: "TextPrimary")
        }
    }
}

#Preview { SettingsViewController() }
