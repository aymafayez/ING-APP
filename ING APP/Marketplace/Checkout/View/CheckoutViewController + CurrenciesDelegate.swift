//
//  CheckoutViewController + CurrenciesDelegate.swift
//  ING APP
//
//  Created by Guest2 on 12/7/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

extension CheckoutViewController: CurrenciesProtocol {
    func didSelectCurrency(currency: String?) {
        currencyLabel.text = currency
    }
}
