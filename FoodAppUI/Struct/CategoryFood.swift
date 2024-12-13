//
//  CategoryFood.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 12.12.24.
//

import Foundation

struct CategoryFood: Codable {
    var categoryId: Int?
    var name: String?
    var image: String?
    var foods: [Food]?
}

