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
        layer.cornerRadius = 10
        setupTitle(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension CommonButton {
    func setupTitle(_ title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = Fonts.display(size: 20).font
    }
}
