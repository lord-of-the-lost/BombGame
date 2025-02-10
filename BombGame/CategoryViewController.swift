//
//  CategoryViewController.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

class CategoryViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.collectionViewLayout = createLayoutForCollection()
    }
    
    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        view.backgroundColor = .white
 
        title = "Категории"

        NSLayoutConstraint.activate([
            
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
        ])
    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Category.allCases.count
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

//#Preview {CategoryViewController () }
