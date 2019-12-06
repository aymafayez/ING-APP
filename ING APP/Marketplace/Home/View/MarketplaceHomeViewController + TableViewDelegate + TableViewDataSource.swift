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
        cell?.productNameLabel.text = products?[indexPath.row].name
        cell?.productImageView.image = products?[indexPath.row].image
        cell?.productUnitLabel.text = products?[indexPath.row].unit.rawValue
        cell?.productPriceLabel.text = String(products?[indexPath.row].price ?? 0.0)
        cell?.productCurrencyLabel.text = products?[indexPath.row].currency.rawValue
        return cell ?? UITableViewCell()
    }

}
