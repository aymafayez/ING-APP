//
//  CurrenciesViewController + TableViewDelegate + TableViewDataSource.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

extension CurrenciesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrenciesTableViewCell") as? CurrenciesTableViewCell
        cell?.currencyString = currenciesList[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let currencyString =  currenciesList[indexPath.row]
         selectedCurrency =  Currency(rawValue: currencyString)
    }
    
    
}
