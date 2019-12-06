//
//  CheckoutViewModel.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class CheckoutViewModel: BaseViewModel {
    
    
    var selectedProducts: [Product]
    var totalAmountCurrency: Currency = .EUR
    init(selectedProducts: [Product]) {
        self.selectedProducts = selectedProducts
    }
    
}
