//
//  CollectionCell.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCell"
    
    var isCellSelected: Bool = false {
        didSet {
            updateCellState()
        }
    }
    
    private lazy var roundedView: RoundedView = {
        let view = RoundedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.black
        return imageView
    }()
    
    private lazy var checkView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor.black
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.rounded(weight: 2, size: 15).font
        label.textColor = Palette.textPrimary
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: GameModel.CategoryModel.Category, needCheckmark: Bool) {
        iconView.image = category.image
        titleLabel.text = category.rawValue
        checkView.isHidden = !needCheckmark
    }
}

// MARK: - Private Methods
private extension CategoryCell {
    func setupUI() {
        contentView.backgroundColor = .clear
        contentView.addSubview(roundedView)
        roundedView.addSubview(iconView)
        roundedView.addSubview(titleLabel)
        roundedView.addSubview(checkView)
    }
    
    func updateCellState() {
        if isCellSelected {
            roundedView.backgroundColor = Palette.greenSelection
            checkView.isHidden = false
        } else {
            roundedView.backgroundColor = Palette.categoryCellBg
            checkView.isHidden = true
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            roundedView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            roundedView.widthAnchor.constraint(equalToConstant: 140),
            roundedView.heightAnchor.constraint(equalToConstant: 140),
            
            iconView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -10),
            iconView.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 60),
            iconView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -4),
            
            checkView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 5),
            checkView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 7),
            checkView.widthAnchor.constraint(equalToConstant: 20),
            checkView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
