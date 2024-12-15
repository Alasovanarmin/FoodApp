//
//  BasketCell.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 15.12.24.
//

import UIKit

class BasketCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImage.contentMode = .scaleAspectFill
        iconImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(food: Food) {
        iconImage.image = UIImage(named: food.image!)
        nameLabel.text = food.name
        ingredientsLabel.text = food.ingredients
        priceLabel.text = String(format: "%.2f", food.price ?? 0) + "$"
    }
}
