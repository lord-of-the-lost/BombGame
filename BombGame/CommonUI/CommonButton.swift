//
//  CommonButton.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//


import UIKit

final class CommonButton: UIButton {
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setupButton()
        setupTitle(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension CommonButton {
    func setupButton() {
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
        layer.cornerRadius = 10
        addTarget(self, action: #selector(touchAction), for: .touchDown)
    }
    
    func setupTitle(_ title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = Fonts.display(size: 20).font
    }
    
    @objc func touchAction() {
        guard DataService.shared.gameModel.settings.vibrationIsOn else { return }
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
}
