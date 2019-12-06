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
        viewModel.selectedProducts.remove(at: indexPath.row)
        tableView.reloadData()
        calculateTotalPrice()
    }
    
    func didAddToCart(at indexPath: IndexPath) {
            viewModel.selectedProducts[indexPath.row].numOfElements = viewModel.selectedProducts[indexPath.row].numOfElements + 1
            tableView.reloadRows(at: [indexPath], with: .automatic)
            calculateTotalPrice()
    }
    
    func didRemoveFromCart(at indexPath: IndexPath) {
            if  viewModel.selectedProducts[indexPath.row].numOfElements != 1 {
                 viewModel.selectedProducts[indexPath.row].numOfElements =  viewModel.selectedProducts[indexPath.row].numOfElements - 1
                tableView.reloadRows(at: [indexPath], with: .automatic)
                calculateTotalPrice()
            }
    }
    
    
}
