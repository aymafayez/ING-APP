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
        return elementsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketplaceHomeTableViewCellEnum.CellReuseIdentifier.rawValue) as? MarketplaceHomeTableViewCell
        cell?._productName = elementsList[indexPath.row].product.name
        cell?._productImage = elementsList[indexPath.row].product.image
        cell?._productUnit = elementsList[indexPath.row].product.unit.rawValue
        cell?._productPrice = elementsList[indexPath.row].product.price
        cell?._productCurrency = elementsList[indexPath.row].product.currency.rawValue
        cell?._numOfElements = elementsList[indexPath.row].numOfElements
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }

}
