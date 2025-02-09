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
        imageView.image = UIImage(named: "checkmark.circle.fill")
        imageView.isHidden = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(roundedView)
        roundedView.addSubview(iconView)
        roundedView.addSubview(titleLabel)
        roundedView.addSubview(checkView)
        
        NSLayoutConstraint.activate([
            roundedView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            roundedView.widthAnchor.constraint(equalToConstant: 60),
            roundedView.heightAnchor.constraint(equalToConstant: 60),
            
            iconView.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 30),
            iconView.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -4),
            
            checkView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 4),
            checkView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 4),
            checkView.widthAnchor.constraint(equalToConstant: 9),
            checkView.heightAnchor.constraint(equalToConstant: 9),
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
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                roundedView.backgroundColor = UIColor.green
                roundedView.layer.borderColor = UIColor.clear.cgColor
                iconView.tintColor = UIColor.white
                checkView.isHidden = false
                
            } else {
                roundedView.backgroundColor = .white
                roundedView.layer.borderColor = UIColor.black.cgColor
                iconView.tintColor = UIColor.black
                checkView.isHidden = true
            }
        }
    }
    
}
