//
//  CurrenciesViewController + SearchBarDelegate.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

extension ChooseCurrencyViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currenciesList = viewModel.getCurrecnyList(searchString: searchText)
    }
}
