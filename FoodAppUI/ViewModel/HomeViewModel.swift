//
//  HomeViewModel.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 12.12.24.
//

import Foundation

class HomeViewModel {
    private var categoriesWithFood: [CategoryFood] = []
    private var fileMangerAdapter = FileManagerHelper()
    
    init() {
        readData()
        print(categoriesWithFood)
    }
    
    func readData() {
        categoriesWithFood = fileMangerAdapter.readCategriesWithFoods()
    }
    
    func getCategoriesCount() -> Int {
        categoriesWithFood.count
    }
    
    func getCategoryByIndex(index: Int) -> CategoryFood {
        categoriesWithFood[index]
    }
}
