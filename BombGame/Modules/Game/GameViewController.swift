//
//  GameViewController.swift
//  BombGame
//
//  Created by Anna Melekhina on 11.02.2025.
//

import UIKit
import Lottie


final class GameViewController: UIViewController {
    private let timer = TimerService()
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundView")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите \"Запустить\",\nчтобы начать игру"
        label.font = Fonts.rounded(weight: 1, size: 28).font
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var animationView: LottieAnimationView = {
        let animation = LottieAnimationView(name: "bomb")
        animation.contentMode = .scaleAspectFit
        animation.backgroundColor = .clear
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        
        return animation
    }()
    
    private lazy var finalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "explosion")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.black
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Запустить", for: .normal)
        button.backgroundColor = UIColor.systemYellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Fonts.display(size: 20).font
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        button.addTarget(self, action: #selector(startPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var newPunishButton: UIButton = {
        let button = UIButton()
        button.setTitle("Другое задание", for: .normal)
        button.backgroundColor = UIColor.systemYellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Fonts.display(size: 20).font
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 2
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(otherPunishPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var punishLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.rounded(weight: 0, size: 28).font
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupNavBar()
        timer.delegate = self
    }
    
}

extension GameViewController: TimerDelegate {
    func timerIsFinished() {
        textLabel.isHidden = true
        animationView.isHidden = true
        finalImageView.isHidden = false
        punishLabel.text = punishments.randomElement()
        punishLabel.isHidden = false
        newPunishButton.isHidden = false
        title = "Конец игры"
        startButton.isHidden = false
        startButton.setTitle("Начать заново", for: .normal)
        AudioPlayerService.shared.playSound(named: GameModel.Settings.Sounds.Boom.one.rawValue, repeatable: false)
    }
}

// MARK: - Private Methods

private extension GameViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(backgroundView)
        view.addSubview(textLabel)
        view.addSubview(animationView)
        view.addSubview(startButton)
        view.addSubview(finalImageView)
        view.addSubview(punishLabel)
        view.addSubview(newPunishButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            animationView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -40),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            finalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            finalImageView.heightAnchor.constraint(equalToConstant: 300),
            finalImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            finalImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            punishLabel.bottomAnchor.constraint(equalTo: newPunishButton.topAnchor, constant: -40),
            punishLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            punishLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            punishLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            newPunishButton.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10),
            newPunishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newPunishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            newPunishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            newPunishButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupGameUI() {
        animationView.play()
        startButton.isHidden = true
        newPunishButton.isHidden = true
        textLabel.text = DataService.shared.getRandomQuestion()
    }
    
    func setupNavBar() {
        title = "Игра"
        
        let pauseButton = UIBarButtonItem(
            image: UIImage(systemName: "pause.circle"),
            style: .plain,
            target: self,
            action: #selector(pauseButtonTapped)
        )
        
        pauseButton.tintColor = .black
        navigationItem.rightBarButtonItem = pauseButton
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: Fonts.rounded(weight: 1, size: 30).font,
            NSAttributedString.Key.foregroundColor: Palette.textPrimary
        ]
        
    }
    
    @objc func startPressed() {
        textLabel.text = DataService.shared.getRandomQuestion()
        textLabel.isHidden = false
        finalImageView.isHidden = true
        punishLabel.isHidden = true
        animationView.isHidden = false
        animationView.play()
        setupGameUI()
        timer.startTimer()
        AudioPlayerService.shared.playSound(named: GameModel.Settings.Sounds.Counter.one.rawValue, repeatable: true)
        title = "Игра"
    }
    
    @objc func pauseButtonTapped() {
        timer.togglePause()
        if timer.isPaused {
            animationView.stop()
            AudioPlayerService.shared.pause()
        } else {
            animationView.play()
            AudioPlayerService.shared.resume()
        }
    }
    
    @objc func otherPunishPressed() {
        punishLabel.text = punishments.randomElement()
    }
}

//#Preview { GameViewController() }
