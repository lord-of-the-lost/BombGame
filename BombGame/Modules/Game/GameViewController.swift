//
//  GameViewController.swift
//  BombGame
//
//  Created by Anna Melekhina on 11.02.2025.
//

import UIKit
import Lottie


final class GameViewController: UIViewController {
    
    enum ScreenState {
        case start
        case game
        case final
    }
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите \"Запустить\",\nчтобы начать игру"
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var animationView: LottieAnimationView = {
        let animation = LottieAnimationView(name: "bomb2")
        animation.contentMode = .scaleAspectFit
        animation.backgroundColor = .clear
        animation.loopMode = .loop
        return animation
    }()
    
    private lazy var finalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "final")
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
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var newPunishButton: UIButton = {
        let button = UIButton()
        button.setTitle("Другое задание", for: .normal)
        button.backgroundColor = UIColor.systemYellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(otherPunishPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var punishLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var timer: Timer?
    private var timeLeft: Int = 5
    private var isTimerPaused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupNavBar()
    }
    
}

// MARK: - Private Methods

extension GameViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(textLabel)
        view.addSubview(animationView)
        view.addSubview(startButton)
        view.addSubview(finalImageView)
        view.addSubview(punishLabel)
        view.addSubview(newPunishButton)
        
        animationView.stop()
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        animationView.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
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
            startButton.widthAnchor.constraint(equalToConstant: 300),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            finalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            finalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            finalImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            punishLabel.topAnchor.constraint(equalTo: finalImageView.bottomAnchor, constant: 30),
            punishLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            punishLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            punishLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            newPunishButton.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10),
            newPunishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newPunishButton.widthAnchor.constraint(equalToConstant: 300),
            newPunishButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupGameUI() {
        animationView.play()
        startButton.isHidden = true
        newPunishButton.isHidden = true
        textLabel.text = questionsByCategory[.sports]?.randomElement()
    }
    
    private func setupTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if timeLeft > 1 {
            timeLeft -= 1
            print(timeLeft)
        } else {
            timer?.invalidate()
            timer = nil
            showGameOverState()
        }
    }
    
    private func pauseTimer() {
        timer?.invalidate()
        timer = nil
        isTimerPaused = true
    }
    
    private func resumeTimer() {
        setupTimer()
        isTimerPaused = false
    }
    
    
    private func showGameOverState() {
        textLabel.isHidden = true
        animationView.isHidden = true
        finalImageView.isHidden = false
        punishLabel.text = punishments.randomElement()
        punishLabel.isHidden = false
        newPunishButton.isHidden = false
        title = "Конец игры"
        startButton.isHidden = false
        startButton.setTitle("Начать заново", for: .normal)
        timeLeft = 5
        AudioPlayerService.shared.playSound(named: "boomOne", repeatable: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            AudioPlayerService.shared.pause()
        }
    }
    
    private func setupNavBar() {
        title = "Игра"
        
        let pauseButton = UIBarButtonItem(
            image: UIImage(systemName: "pause.circle"),
            style: .plain,
            target: self,
            action: #selector(pauseButtonTapped)
        )
        
        pauseButton.tintColor = .yellow
        navigationItem.rightBarButtonItem = pauseButton
    }
    
    @objc private func startPressed() {
        textLabel.text = questionsByCategory[.sports]?.randomElement()
        textLabel.isHidden = false
        finalImageView.isHidden = true
        punishLabel.isHidden = true
        animationView.isHidden = false
        animationView.play()
        
        setupTimer()
        setupGameUI()
        AudioPlayerService.shared.playSound(named: "counterOne", repeatable: true)
        
    }
    
    @objc private func pauseButtonTapped() {
        
        if !isTimerPaused {
            animationView.stop()
            AudioPlayerService.shared.pause()
            pauseTimer()
        } else {
            animationView.play()
            AudioPlayerService.shared.playSound(named: "counterOne", repeatable: true)
            resumeTimer()
        }
    }
    
    @objc private func otherPunishPressed() {
        punishLabel.text = punishments.randomElement()
    }
}

//#Preview { GameViewController() }
