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
    private let player = AudioPlayerService.shared
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .backgroundView)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите \"Запустить\",\nчтобы начать игру"
        label.font = Fonts.rounded(weight: 500, size: 28).font
        label.textColor = Palette.textPrimary
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
        imageView.image = UIImage(resource: .explosion)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.black
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var startButton: CommonButton = {
        let button = CommonButton(title: "Запустить", backgroundColor: Palette.gameViewButton)
        button.addTarget(self, action: #selector(startPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var newPunishButton: CommonButton = {
        let button = CommonButton(title: "Другое задание", backgroundColor: Palette.gameViewButton)
        button.isHidden = true
        button.addTarget(self, action: #selector(otherPunishPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var punishLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.rounded(weight: 600, size: 28).font
        label.textColor = Palette.textPrimary
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
        
        setupNavigationBar(
            title: "Игра",
            rightIcon: UIImage(named: "pause"),
            rightAction: #selector(pauseButtonTapped)
        )
        timer.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player.stop()
        timer.stopTimer()
    }
}

extension GameViewController: TimerDelegate {
    func timerIsFinished() {
        textLabel.isHidden = true
        animationView.isHidden = true
        finalImageView.isHidden = false
        showPunishIfNeeded()
        setupNavigationBar(title: "Конец игры")
        navigationItem.rightBarButtonItem?.isHidden = true
        navigationItem.leftBarButtonItem?.isHidden = true
        startButton.isHidden = false
        startButton.setTitle("Начать заново", for: .normal)
        player.playSound(named: DataService.shared.gameModel.settings.boomSound.rawValue, repeatable: false)
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
    
    func showPunishIfNeeded() {
        guard DataService.shared.gameModel.settings.punishmentsIsOn else { return }
        punishLabel.text = DataService.shared.getRandomPunishment()
        punishLabel.isHidden = false
        newPunishButton.isHidden = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            animationView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -40),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            finalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            finalImageView.heightAnchor.constraint(equalToConstant: 300),
            finalImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            finalImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            punishLabel.bottomAnchor.constraint(equalTo: newPunishButton.topAnchor, constant: -40),
            punishLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            punishLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            punishLabel.topAnchor.constraint(equalTo: finalImageView.bottomAnchor, constant: 10),
            
            newPunishButton.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -10),
            newPunishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            newPunishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            newPunishButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupGameUI() {
        animationView.play()
        startButton.isHidden = true
        newPunishButton.isHidden = true
        textLabel.text = DataService.shared.getRandomQuestion()
    }
    
    @objc func startPressed() {
        setupNavigationBar(title: "Игра")
        navigationItem.rightBarButtonItem?.isHidden = false
        navigationItem.leftBarButtonItem?.isHidden = false
        finalImageView.isHidden = true
        punishLabel.isHidden = true
        textLabel.isHidden = false
        animationView.isHidden = false

        if startButton.currentTitle == "Запустить" {
            textLabel.text = DataService.shared.getRandomQuestion()
            navigationItem.hidesBackButton = false
            
            animationView.play()
            setupGameUI()
            timer.startTimer()
            player.playSound(
                named: DataService.shared.gameModel.settings.counterSound.rawValue,
                repeatable: true
            )
        } else {
            startButton.setTitle("Запустить", for: .normal)
            animationView.stop()
            player.stop()
            textLabel.text = "Нажмите запустить, чтобы начать"
            newPunishButton.isHidden = true
        }
    }
    
    @objc func pauseButtonTapped() {
        if !startButton.isHidden {
            return
        } else {
            timer.togglePause()
            if timer.isPaused {
                animationView.stop()
                player.pause()
            } else {
                animationView.play()
                player.resume()
            }
        }
    }
    
    @objc func otherPunishPressed() {
        punishLabel.text = DataService.shared.getRandomPunishment()
    }
}
