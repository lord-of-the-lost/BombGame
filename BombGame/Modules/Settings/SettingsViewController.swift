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
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "ВРЕМЯ ИГРЫ"
        label.font = Fonts.rounded(weight: 0, size: 20).font
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shortButton = createButton(title: "Короткое")
    private lazy var mediumButton = createButton(title: "Среднее")
    private lazy var longButton = createButton(title: "Длинное")
    private lazy var randomButton = createButton(title: "Случайное")
    
    private lazy var musicLabel = createLabel(text: "Фоновая музыка")
    private lazy var tickingLabel = createLabel(text: "Тикание бомбы")
    private lazy var explosionLabel = createLabel(text: "Взрыв бомбы")
    private lazy var vibrationLabel = createLabel(text: "Вибрация")
    private lazy var gameTasksLabel = createLabel(text: "Игра с заданиями")
    
    private lazy var  soundButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Мелодия 1 >", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        return button
    }()
    
    private lazy var  tickButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Часы 2 >", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        return button
    }()
    
    private lazy var  explosionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Взрыв 1 >", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        return button
    }()
    
    private lazy var vibrationSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.onTintColor = UIColor(named: "GameViewButton")
        toggle.translatesAutoresizingMaskIntoConstraints = false
        
        return toggle
    }()
    
    private lazy var gameTasksSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.onTintColor = UIColor(named: "GameViewButton")
        toggle.translatesAutoresizingMaskIntoConstraints = false
        
        return toggle
    }()
    
    private lazy var soundStack = createStackView(with: [musicLabel, soundButton])
    private lazy var tickStack = createStackView(with: [tickingLabel, tickButton])
    private lazy var explosionStack = createStackView(with: [explosionLabel, explosionButton])
    private lazy var vibrationStack = createStackView(with: [vibrationLabel, vibrationSwitch])
    private lazy var gameTasksStack = createStackView(with: [gameTasksLabel, gameTasksSwitch])
    
    private lazy var blackView1 = createBlackView()
    private lazy var blackView2 = createBlackView()
    private lazy var blackView3 = createBlackView()
    private lazy var blackView4 = createBlackView()
    private lazy var blackView5 = createBlackView()
    
    
    
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
        firstView.addSubview(timeLabel)
        
        secView.addSubview(blackView1)
        secView.addSubview(blackView2)
        secView.addSubview(blackView3)
        
        thirdView.addSubview(blackView4)
        thirdView.addSubview(blackView5)
        
        blackView1.addSubview(soundStack)
        blackView2.addSubview(tickStack)
        blackView3.addSubview(explosionStack)
        blackView4.addSubview(vibrationStack)
        blackView5.addSubview(gameTasksStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstView.bottomAnchor.constraint(equalTo: longButton.bottomAnchor, constant: 16),
            
            timeLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 10),
            
            shortButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 16),
            shortButton.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.4),
            shortButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            
            mediumButton.leadingAnchor.constraint(equalTo: shortButton.trailingAnchor, constant: 10),
            mediumButton.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.4),
            mediumButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            
            longButton.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 16),
            longButton.topAnchor.constraint(equalTo: shortButton.bottomAnchor, constant: 10),
            longButton.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.4),
            
            randomButton.leadingAnchor.constraint(equalTo: longButton.trailingAnchor, constant: 10),
            randomButton.topAnchor.constraint(equalTo: mediumButton.bottomAnchor, constant: 10),
            randomButton.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.4),
            
            secView.topAnchor.constraint(equalTo: firstView.bottomAnchor, constant: 16),
            secView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            thirdView.topAnchor.constraint(equalTo: secView.bottomAnchor, constant: 16),
            thirdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thirdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            blackView1.leadingAnchor.constraint(equalTo: secView.leadingAnchor, constant: 20),
            blackView1.trailingAnchor.constraint(equalTo: secView.trailingAnchor, constant: -20),
            blackView1.topAnchor.constraint(equalTo: secView.topAnchor, constant: 20),
            blackView1.heightAnchor.constraint(equalToConstant: 45),
            
            blackView2.leadingAnchor.constraint(equalTo: secView.leadingAnchor, constant: 20),
            blackView2.trailingAnchor.constraint(equalTo: secView.trailingAnchor, constant: -20),
            blackView2.topAnchor.constraint(equalTo: blackView1.bottomAnchor, constant: 20),
            blackView2.heightAnchor.constraint(equalToConstant: 45),
            
            blackView3.leadingAnchor.constraint(equalTo: secView.leadingAnchor, constant: 20),
            blackView3.trailingAnchor.constraint(equalTo: secView.trailingAnchor, constant: -20),
            blackView3.topAnchor.constraint(equalTo: blackView2.bottomAnchor, constant: 20),
            blackView3.heightAnchor.constraint(equalToConstant: 45),
            secView.bottomAnchor.constraint(equalTo: blackView3.bottomAnchor, constant: 16),

            blackView4.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 20),
            blackView4.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -20),
            blackView4.topAnchor.constraint(equalTo: thirdView.topAnchor, constant: 20),
            blackView4.heightAnchor.constraint(equalToConstant: 45),
            
            blackView5.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 20),
            blackView5.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -20),
            blackView5.topAnchor.constraint(equalTo: blackView4.bottomAnchor, constant: 20),
            blackView5.heightAnchor.constraint(equalToConstant: 45),
            thirdView.bottomAnchor.constraint(equalTo: blackView5.bottomAnchor, constant: 16),

            soundStack.leadingAnchor.constraint(equalTo: blackView1.leadingAnchor, constant: 10),
            soundStack.trailingAnchor.constraint(equalTo: blackView1.trailingAnchor, constant: -10),
            soundStack.centerYAnchor.constraint(equalTo: blackView1.centerYAnchor),
            
            tickStack.leadingAnchor.constraint(equalTo: blackView2.leadingAnchor, constant: 10),
            tickStack.trailingAnchor.constraint(equalTo: blackView2.trailingAnchor, constant: -10),
            tickStack.centerYAnchor.constraint(equalTo: blackView2.centerYAnchor),
            
            explosionStack.leadingAnchor.constraint(equalTo: blackView3.leadingAnchor, constant: 10),
            explosionStack.trailingAnchor.constraint(equalTo: blackView3.trailingAnchor, constant: -10),
            explosionStack.centerYAnchor.constraint(equalTo: blackView3.centerYAnchor),
            
            vibrationStack.leadingAnchor.constraint(equalTo: blackView4.leadingAnchor, constant: 10),
            vibrationStack.trailingAnchor.constraint(equalTo: blackView4.trailingAnchor, constant: -10),
            vibrationStack.centerYAnchor.constraint(equalTo: blackView4.centerYAnchor),
            
            gameTasksStack.leadingAnchor.constraint(equalTo: blackView5.leadingAnchor, constant: 10),
            gameTasksStack.trailingAnchor.constraint(equalTo: blackView5.trailingAnchor, constant: -10),
            gameTasksStack.centerYAnchor.constraint(equalTo: blackView5.centerYAnchor),
            
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
        button.layer.cornerRadius = 13
        button.titleLabel?.font = Fonts.rounded(weight: 10, size: 16).font
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(chooseLength(sender:)), for: .touchUpInside)
        return button
    }
    
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = Fonts.rounded(weight: 0, size: 18).font
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func createStackView(with arrangedSubviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func createBlackView() -> UIView {
        let view = RoundedView()
        view.backgroundColor = UIColor(named: "TextPrimary")
        view.layer.shadowOpacity = 0
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    @objc private func showPicker() {
        print("Выбор звука")
    }
}

#Preview { SettingsViewController() }
