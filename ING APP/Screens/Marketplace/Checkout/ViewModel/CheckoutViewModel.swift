//
//  CheckoutViewModel.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class CheckoutViewModel: BaseViewModel {
    
    
    private var selectedCartElements: [CartElement]
    
    init(selectedCartProducts: [CartElement]) {
        self.selectedCartElements = selectedCartProducts
    }
    
    func getSelectedElements() -> [CartElement] {
        return selectedCartElements
    }
    
    func calculateTotalPrice(cartElements: [CartElement],currency: Currency, onSuccess: @escaping (Double) -> () , onAPIError: @escaping (String) -> (), onConnectionError: @escaping (String) -> ()) {
        let dto = EmptyDTO()
        let api = LatestExchangeRateAPI(requestDTO: dto, accessKey:"f9482427865f5aec38729ba5be54f8ea", onSuccess: { exchangeRateDTO in
            var totalAmount = 0.0
            let exchangeRate = exchangeRateDTO?.rates[currency.rawValue]
                for cartElement in cartElements {
                    let amount = cartElement.product.price * Double(cartElement.numOfElements)
                    totalAmount = totalAmount +  amount
                }
                onSuccess (totalAmount * exchangeRate!)
        }, onAPIError: { error in
            onAPIError(error.localizedDescription)
        }, onConnectionError: { error in
            onConnectionError(error.localizedDescription)
        })
        api.execute()
    }
    
    
    
}
