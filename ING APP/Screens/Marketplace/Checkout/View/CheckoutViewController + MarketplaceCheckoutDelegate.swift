//
//  CheckoutViewController + MarketplaceCheckoutDelegate.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

extension CheckoutViewController: MarketplaceCheckoutDelegate {
    
    func removeProduct(at indexPath: IndexPath) {
        selectedElements.remove(at: indexPath.row)
        tableView.reloadData()
        calculateTotalPriceAndUpdateUI(cartElements: selectedElements, currency: selectedCurrency)
    }
    
    func didAddToCart(at indexPath: IndexPath) {
        selectedElements[indexPath.row].numOfElements = selectedElements[indexPath.row].numOfElements + 1
            tableView.reloadRows(at: [indexPath], with: .automatic)
            calculateTotalPriceAndUpdateUI(cartElements: selectedElements, currency: selectedCurrency)
    }
    
    func didRemoveFromCart(at indexPath: IndexPath) {
        if  selectedElements[indexPath.row].numOfElements != 1 {
                selectedElements[indexPath.row].numOfElements =  selectedElements[indexPath.row].numOfElements - 1
                tableView.reloadRows(at: [indexPath], with: .automatic)
                calculateTotalPriceAndUpdateUI(cartElements: selectedElements, currency: selectedCurrency)
        }
    }
    
}
