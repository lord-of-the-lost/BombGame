//
//  HelpCategoryViewController.swift
//  BombGame
//
//  Created by Дарья on 13.02.2025.
//

import UIKit

final class HelpCategoryViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 80, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    private lazy var helpCategoryTitle: UILabel = {
        let label = UILabel()
        label.text = "Правила Игры"
        label.textColor = Palette.textPrimary
        label.font = Fonts.rounded(weight: 900 , size: 30).font
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoryDescription: UILabel = {
        let label = UILabel()
        label.text = "В игре доступно 6 категорий и более 90 вопросов."
        label.textColor = Palette.textPrimary
        label.font = Fonts.rounded(weight: 2, size: 24).font
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoryRule: UILabel = {
        let label = UILabel()
        label.text = "Можно выбрать сразу несколько категорий для игры."
        label.textColor = Palette.textPrimary
        label.font = Fonts.display(size: 24).font
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: ImageResource.backgroundView)
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout = createLayoutForCollection()
    }
}


// MARK: - Private Methods
private extension HelpCategoryViewController {
    func setupView() {
        view.backgroundColor = Palette.categorySheetBg
        view.addSubview(backgroundImageView)
        view.addSubview(helpCategoryTitle)
        view.addSubview(categoryDescription)
        view.addSubview(categoryRule)
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            helpCategoryTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helpCategoryTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            categoryDescription.topAnchor.constraint(equalTo: helpCategoryTitle.bottomAnchor, constant: 10),
            categoryDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 37),
            categoryDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -38),
            
            categoryRule.topAnchor.constraint(equalTo: categoryDescription.bottomAnchor, constant: 50),
            categoryRule.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 37),
            categoryRule.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -38),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            collectionView.topAnchor.constraint(equalTo: categoryRule.bottomAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}



// MARK: - UICollectionViewDataSource
extension HelpCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.identifier,
            for: indexPath
        ) as? CategoryCell else {
            return UICollectionViewCell()
        }
        
        let category = Category.allCases[indexPath.item]
        cell.configure(with: category)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HelpCategoryViewController: UICollectionViewDelegateFlowLayout {}

// MARK: - Private Methods
private extension HelpCategoryViewController {
    func createLayoutForCollection() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let basicSpacing: CGFloat = 10
        let itemsPerRow: CGFloat = 2
        let paddingWidth = basicSpacing * (itemsPerRow + 1)
        let availableWidth = collectionView.bounds.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        layout.minimumLineSpacing = basicSpacing
        layout.minimumInteritemSpacing = basicSpacing
        layout.sectionInset = UIEdgeInsets(top: basicSpacing, left: basicSpacing, bottom: 0, right: basicSpacing)
        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        return layout
    }
}

