//
//  CategoryViewController.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .backgroundView)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 80, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
        setupNavigationBar(
            title: "Категории",
            rightIcon: UIImage(named: "questYellow"),
            rightAction: #selector(questionButtonTapped)
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout = createLayoutForCollection()
    }
}

// MARK: - UICollectionViewDelegate
extension CategoryViewController: UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.isCellSelected.toggle()
            DataService.shared.gameModel.categories[indexPath.item].isSelected.toggle()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        DataService.shared.getAllCategories().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.identifier,
            for: indexPath
        ) as? CategoryCell else {
            return UICollectionViewCell()
        }
        
        let category = DataService.shared.getAllCategories()[indexPath.item].category
        cell.configure(with: category, needCheckmark: false)
        cell.isCellSelected = DataService.shared.getAllCategories()[indexPath.item].isSelected
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryViewController: UICollectionViewDelegateFlowLayout {}

// MARK: - Private Methods
private extension CategoryViewController {
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
    
    func setupUI() {
        view.addSubview(backgroundImage)
        view.addSubview(collectionView)
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
        ])
    }
    
    @objc func questionButtonTapped() {
        let modalViewController = HelpCategoryViewController()
        
        if let sheet = modalViewController.sheetPresentationController {
            sheet.detents = [.custom { _ in UIScreen.main.bounds.height * 0.75 }]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        present(modalViewController, animated: true)
    }
}
