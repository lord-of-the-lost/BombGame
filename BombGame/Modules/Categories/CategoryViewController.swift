//
//  CategoryViewController.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 80, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollection()
        setupUI()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.collectionViewLayout = createLayoutForCollection()
    }
    
    
}

extension CategoryViewController: UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.isCellSelected.toggle()
        }
    }
    
}


extension CategoryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Category.allCases.count
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


extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    private func createLayoutForCollection() -> UICollectionViewFlowLayout {
        
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

extension CategoryViewController {
    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
        ])
    }
    
    private func setupNavigationBar() {
        title = "Категории"
        let questionButton = UIBarButtonItem(
            image: UIImage(systemName: "questionmark.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(questionButtonTapped)
        )
        
        questionButton.tintColor = .yellow
        navigationItem.rightBarButtonItem = questionButton
    }
    
    @objc private func questionButtonTapped() {
    }
}


//#Preview {CategoryViewController () }
