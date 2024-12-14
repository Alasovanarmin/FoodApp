//
//  FoodListController.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 14.12.24.
//

import UIKit

class FoodListController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = FoodListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "\(ProductCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ProductCell.self)")
    }
}

extension FoodListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getFoodsCount()
//        viewModel.getFoods().count // The Same thing
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductCell.self)", for: indexPath) as! ProductCell
        
        cell.configure(food: viewModel.getFoodByIndex(index: indexPath.row))
        
        cell.addToBasketAction = {
            let food = self.viewModel.getFoodByIndex(index: indexPath.row)
            
            self.viewModel.addToBasket(food: food)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2 // 2 sütunlu layout
        return CGSize(width: width, height: width + 40) // Şəkil + yazı
    }
}
