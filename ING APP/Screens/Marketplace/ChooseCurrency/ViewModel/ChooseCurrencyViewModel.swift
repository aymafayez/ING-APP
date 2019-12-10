//
//  CurrenciesViewModel.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class ChooseCurrencyViewModel: BaseViewModel {
    
    // MARK: - Properties
    private var fullCurrenciesList: [String] {
        return Locale.isoCurrencyCodes
    }
    
    // MARK: - Methods
    func getCurrecnyList(searchString: String?) -> [String] {
        if let _searchString = searchString {
            let  filteredList = _searchString.isEmpty ? fullCurrenciesList : fullCurrenciesList.filter { (item: String) -> Bool in
                return item.range(of: _searchString, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            return filteredList
        }
        else {
            return fullCurrenciesList
        }

    }
    
    
}
