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
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

