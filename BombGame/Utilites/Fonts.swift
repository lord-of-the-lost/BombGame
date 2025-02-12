//
//  Fonts.swift
//  BombGame
//
//  Created by Николай Игнатов on 08.02.2025.
//

import UIKit

enum Fonts {
    case rounded(weight: CGFloat, size: CGFloat)
    case display(size: CGFloat)
    
    var font: UIFont {
        switch self {
        case .rounded(let weightValue, let size):
            let weight = UIFont.Weight(rawValue: weightValue)
            let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
            guard let roundedDescriptor = systemFont.fontDescriptor.withDesign(.rounded) else {
                return systemFont
            }
            return UIFont(descriptor: roundedDescriptor, size: size)
            
        case .display(let size):
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
}
