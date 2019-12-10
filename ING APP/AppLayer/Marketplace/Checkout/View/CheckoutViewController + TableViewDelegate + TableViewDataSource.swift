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
        return  selectedElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CheckoutTableViewCellEnum.CellReuseIdentifier.rawValue) as? CheckoutTableViewCell
        cell?._productName = selectedElements[indexPath.row].product.name
        cell?._productImage = selectedElements[indexPath.row].product.image
        cell?._productUnit = selectedElements[indexPath.row].product.unit.rawValue
        cell?._productPrice = selectedElements[indexPath.row].product.price
        cell?._productCurrency = selectedElements[indexPath.row].product.currency.rawValue
        cell?._numOfElements = selectedElements[indexPath.row].numOfElements
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
}
