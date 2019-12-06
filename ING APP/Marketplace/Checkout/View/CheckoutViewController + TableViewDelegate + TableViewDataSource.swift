//
//  CheckoutViewController + TableViewDelegate + TableViewDataSource.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import UIKit

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.selectedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell") as? CheckoutTableViewCell
        cell?._productName = viewModel.selectedProducts[indexPath.row].name
        cell?._productImage = viewModel.selectedProducts[indexPath.row].image
        cell?._productUnit = viewModel.selectedProducts[indexPath.row].unit.rawValue
        cell?._productPrice = viewModel.selectedProducts[indexPath.row].price
        cell?._productCurrency = viewModel.selectedProducts[indexPath.row].currency.rawValue
        cell?._numOfElements = viewModel.selectedProducts[indexPath.row].numOfElements
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    
    
    
}
