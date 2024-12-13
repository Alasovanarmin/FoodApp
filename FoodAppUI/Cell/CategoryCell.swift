//
//  CategoryCell.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 12.12.24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        nameLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        
        let darkLayer = CALayer()
        darkLayer.frame = imageView.bounds
        darkLayer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
        imageView.layer.addSublayer(darkLayer)
    }
    
    func configure(category: CategoryFood){
        nameLabel.text = category.name
        imageView.image = UIImage(named: category.image!)
    }

}
