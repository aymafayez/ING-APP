//
//  CheckoutViewController + CurrenciesDelegate.swift
//  ING APP
//
//  Created by Guest2 on 12/7/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

extension CheckoutViewController: ChooseCurrencyDelegate {
    
    func didSelectCurrency(currency: Currency?) {
        if let _currency = currency {
            selectedCurrency = _currency
            updateCurrencyLabel(text: _currency.rawValue)
            calculateTotalPriceAndUpdateUI(cartElements: selectedElements, currency: _currency)
        }
    }
    
}
