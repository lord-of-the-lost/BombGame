//
//  NavBar.swift
//  BombGame
//
//  Created by Anna Melekhina on 15.02.2025.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBar(title: String,
                            leftIcon: UIImage? = nil, leftAction: Selector? = nil,
                            rightIcon: UIImage? = nil, rightAction: Selector? = nil) {
        
        let label = UILabel()
        label.text = title
        label.font = Fonts.rounded(weight: 10, size: 30).font
        label.textColor = Palette.textPrimary
        
        navigationItem.titleView = label
//        navigationItem.backButtonDisplayMode = .minimal

      
        if let rightIcon = rightIcon, let rightAction = rightAction {
            let rightButton = UIButton(type: .system)
            rightButton.setImage(rightIcon.withRenderingMode(.alwaysOriginal), for: .normal)
            rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            rightButton.addTarget(self, action: rightAction, for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        }
        

    }
}
