//
//  MainMenuViewController.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import UIKit

final class MainMenuViewController: UIViewController {
    private let presenter: MainMenuPresenterProtocol
    
    private lazy var gameTitle: UILabel = {
        let label = UILabel()
        label.text = "Бомба"
        label.font = Fonts.sfProRounded48
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(presenter: MainMenuPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "use init(presenter: MainMenuPresenterProtocol) instead")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - MainMenuViewProtocol
extension MainMenuViewController: MainMenuViewProtocol {}

// MARK: - Private Methods
private extension MainMenuViewController {
    func setupView() {
        view.backgroundColor = Palette.mainBackground
        view.addSubview(gameTitle)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }
}
