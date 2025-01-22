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
        
        collectionView.register(UINib(nibName: "\(ProductCell.self)", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(basketButtonTapped))
        self.navigationItem.rightBarButtonItem = cartButton
        
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(profileButtonTapped))
        self.navigationItem.leftBarButtonItem = profileButton

    }
    
    @objc func basketButtonTapped() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(BasketController.self)") as! BasketController
        navigationController?.show(controller, sender: nil)
    }
    @objc func profileButtonTapped() {
        let controller = storyboard?.instantiateViewController(identifier: "\(ProfileController.self)") as! ProfileController
        
        navigationController?.show(controller, sender: nil)
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getCategoriesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductCell.self)", for: indexPath) as! ProductCell
        productCell.configure(category: viewModel.getCategoryByIndex(index: indexPath.row))
        return productCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: collectionView.frame.width / 2 - 16, height: 200)
        let width = (collectionView.frame.width - 30) / 2 // 2 sütunlu layout
        return CGSize(width: width, height: width + 40) // Şəkil + yazı
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(FoodListController.self)") as! FoodListController
        
        controller.viewModel.setFoods(foods: viewModel.getCategoryByIndex(index: indexPath.row).foods ?? [])
        navigationController?.show(controller, sender: nil)
    }
}
