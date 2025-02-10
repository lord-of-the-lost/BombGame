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
        
        private func setupView() {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.layer.cornerRadius = 20
            self.layer.masksToBounds = false
            self.layer.shadowOpacity = 0.3
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowRadius = 2
            self.backgroundColor = .white
            self.layer.borderColor = UIColor.systemGray.cgColor
            self.layer.borderWidth = 1
        }
}


