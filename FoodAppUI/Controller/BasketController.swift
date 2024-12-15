//
//  BasketController.swift
//  FoodAppUI
//
//  Created by Narmin Alasova on 15.12.24.
//

import UIKit

class BasketController: UIViewController {
    @IBOutlet weak var basketHeader: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = BasketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Basket"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "\(BasketCell.self)", bundle: nil), forCellReuseIdentifier: "\(BasketCell.self)")
        
        basketHeader.text = "\(viewModel.basketItemCount()) items for \(viewModel.getBasketTotalPrice())$"
    }
    
    @IBAction func basketCheckOutTappedButton(_ sender: Any) {
    }
}

extension BasketController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.basketItemCount()
//        viewModel.getBasketItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(BasketCell.self)", for: indexPath) as! BasketCell
        
//        cell.configure(food: viewModel.getBasketItems()[indexPath.row])
        cell.configure(food: viewModel.getBasketItemByIndex(index: indexPath.row))
        
        return cell
    }
}
