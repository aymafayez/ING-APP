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
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketplaceHomeTableViewCell") as? MarketplaceHomeTableViewCell
        cell?._productName = products?[indexPath.row].name 
        cell?._productImage = products?[indexPath.row].image
        cell?._productUnit = products?[indexPath.row].unit.rawValue
        cell?._productPrice = products?[indexPath.row].price
        cell?._productCurrency = products?[indexPath.row].currency.rawValue
        cell?._numOfElements = products?[indexPath.row].numOfElements
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }

}
