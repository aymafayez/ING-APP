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
        return  viewModel.selectedCartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell") as? CheckoutTableViewCell
        cell?._productName = viewModel.selectedCartProducts[indexPath.row].product.name
        cell?._productImage = viewModel.selectedCartProducts[indexPath.row].product.image
        cell?._productUnit = viewModel.selectedCartProducts[indexPath.row].product.unit.rawValue
        cell?._productPrice = viewModel.selectedCartProducts[indexPath.row].product.price
        cell?._productCurrency = viewModel.selectedCartProducts[indexPath.row].product.currency.rawValue
        cell?._numOfElements = viewModel.selectedCartProducts[indexPath.row].numOfElements
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    
    
    
}
