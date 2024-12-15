//
//  BasketViewModel.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 15.12.24.
//

class BasketViewModel {
    var fileManager = FileManagerHelper()
    private var foods: [Food] = []
    
    init() {
        readBasket()
    }
    
    private func readBasket() {
        foods = fileManager.readBasketData()
    }
    //1
    func basketItemCount() -> Int {
        foods.count
    }
    //2
    func getBasketItems() -> [Food] {
        foods
    }
    
    func getBasketItemByIndex(index: Int) -> Food {
        return foods[index]
    }
    
    func getBasketTotalPrice() -> Double {
        var sum: Double = 0
        foods.forEach { sum += $0.price ?? 0 }
        
        return sum
    }
}

