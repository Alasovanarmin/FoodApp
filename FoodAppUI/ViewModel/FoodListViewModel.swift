//
//  FoodListViewModel.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 14.12.24.
//

class FoodListViewModel {
    private var foods: [Food] = []
    private var fileManager = FileManagerHelper()
    
    func setFoods(foods: [Food]) {
        self.foods = foods
    }
    
    func getFoodByIndex(index: Int) -> Food {
        foods[index]
    } /*-------> */
    
    func getFoods() -> [Food] {
        foods
    }
    
    func getFoodsCount() -> Int {
        foods.count
    }
    
    func addToBasket(food: Food) {
        var foods = fileManager.readBasketData()
        
        foods.append(food)
        
        self.fileManager.writeBasketData(foods: foods)
    }
}
