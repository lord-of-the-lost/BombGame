//
//  NavBar.swift
//  BombGame
//
//  Created by Anna Melekhina on 15.02.2025.
//

import UIKit

extension UIViewController {
    func setupNavigationBar(
        title: String,
        leftIcon: UIImage? = nil,
        leftAction: Selector? = nil,
        rightIcon: UIImage? = nil,
        rightAction: Selector? = nil
    ) {
        
        let label = UILabel()
        label.text = title
        label.font = Fonts.rounded(weight: 10, size: 30).font
        label.textColor = Palette.textPrimary
        
        navigationItem.titleView = label
        
        if let leftIcon, let leftAction {
            let leftButton = UIButton(type: .system)
            leftButton.setImage(leftIcon.withRenderingMode(.alwaysOriginal), for: .normal)
            leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            leftButton.addTarget(self, action: leftAction, for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: leftButton)
        } else {
            let leftButton = UIButton(type: .system)
            let backImage = UIImage(systemName: "chevron.left")
            leftButton.setImage(backImage?.withRenderingMode(.alwaysOriginal), for: .normal)
            leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            leftButton.addAction(popViewController(), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        }
        
        if let rightIcon, let rightAction {
            let rightButton = UIButton(type: .system)
            rightButton.setImage(rightIcon.withRenderingMode(.alwaysOriginal), for: .normal)
            rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            rightButton.addTarget(self, action: rightAction, for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        }
        
        func popViewController() -> UIAction {
            UIAction { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
}
