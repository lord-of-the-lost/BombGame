//
//  CellView.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

extension UIView {
    static func makeRoundRectangle() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 20
    view.layer.masksToBounds = false
    view.layer.shadowOpacity = 0.3
    view.layer.shadowOffset = CGSize(width: 0, height: 2)
    view.layer.shadowRadius = 2
    view.backgroundColor = .white
    view.layer.borderColor = UIColor.systemGray.cgColor
    view.layer.borderWidth = 1
    return view
}

}
