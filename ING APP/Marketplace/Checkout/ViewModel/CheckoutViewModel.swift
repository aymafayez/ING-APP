//
//  CheckoutViewModel.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class CheckoutViewModel: BaseViewModel {
    
    
    var selectedCartProducts: [CartElement]
    var totalAmountCurrency: Currency = .EUR
    init(selectedCartProducts: [CartElement]) {
        self.selectedCartProducts = selectedCartProducts
    }
    
}
