//
//  CollectionCell.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    let roundedView = makeRoundRectangle()

    
    let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.black
        
        return imageView
    }()
    
    let checkView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.black
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.isHidden = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true  
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var isCellSelected: Bool = false {
           didSet {
               if isCellSelected {
                   roundedView.backgroundColor = UIColor.green
                   checkView.isHidden = false
               } else {
                   roundedView.backgroundColor = .white
                   checkView.isHidden = true
               }
           }
       }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(roundedView)
        roundedView.addSubview(iconView)
        roundedView.addSubview(titleLabel)
        roundedView.addSubview(checkView)
        
        NSLayoutConstraint.activate([
            roundedView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            roundedView.widthAnchor.constraint(equalToConstant: 140),
            roundedView.heightAnchor.constraint(equalToConstant: 140),
            
            iconView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -10),
            iconView.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 80),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -4),
            
            checkView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 14),
            checkView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 14),
            checkView.widthAnchor.constraint(equalToConstant: 25),
            checkView.heightAnchor.constraint(equalToConstant: 25),
        ])
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: Category) {
        iconView.image = UIImage(systemName: "figure.run")
        titleLabel.text = category.rawValue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            isCellSelected.toggle()
        }
    
}
