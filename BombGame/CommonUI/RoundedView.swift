//
//  CellView.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

final class RoundedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - Private Methods
private extension RoundedView {
    func setupView() {
        backgroundColor = Palette.categoryCellBg
        layer.cornerRadius = 20
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
        layer.borderColor = UIColor.systemGray.cgColor
        layer.borderWidth = 1
    }
}

