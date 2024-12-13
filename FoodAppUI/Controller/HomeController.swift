//
//  HomeController.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 12.12.24.
//

import UIKit


class HomeController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "\(CategoryCell.self)", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil /*action: #selector(cartButtonTapped)*/)
        self.navigationItem.rightBarButtonItem = cartButton

    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getCategoriesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCell.self)", for: indexPath) as! CategoryCell
        
        categoryCell.configure(category: viewModel.getCategoryByIndex(index: indexPath.row))
        return categoryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: collectionView.frame.width / 2 - 16, height: 200)
        let width = (collectionView.frame.width - 30) / 2 // 2 sütunlu layout
        return CGSize(width: width, height: width + 40) // Şəkil + yazı
    }
}
