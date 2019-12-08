//
//  MarketplaceHomeViewController + TableViewDelegate + TableViewDataSource.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

extension MarketplaceHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartElementsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketplaceHomeTableViewCell") as? MarketplaceHomeTableViewCell
        cell?._productName = viewModel.cartElementsList[indexPath.row].product.name
        cell?._productImage = viewModel.cartElementsList[indexPath.row].product.image
        cell?._productUnit = viewModel.cartElementsList[indexPath.row].product.unit.rawValue
        cell?._productPrice = viewModel.cartElementsList[indexPath.row].product.price
        cell?._productCurrency = viewModel.cartElementsList[indexPath.row].product.currency.rawValue
        cell?._numOfElements = viewModel.cartElementsList[indexPath.row].numOfElements
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }

}
