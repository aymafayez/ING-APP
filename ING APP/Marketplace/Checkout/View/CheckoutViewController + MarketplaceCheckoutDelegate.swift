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
        viewModel.selectedCartProducts.remove(at: indexPath.row)
        tableView.reloadData()
        calculateTotalPrice()
    }
    
    func didAddToCart(at indexPath: IndexPath) {
        viewModel.selectedCartProducts[indexPath.row].numOfElements = viewModel.selectedCartProducts[indexPath.row].numOfElements + 1
            tableView.reloadRows(at: [indexPath], with: .automatic)
            calculateTotalPrice()
    }
    
    func didRemoveFromCart(at indexPath: IndexPath) {
            if  viewModel.selectedCartProducts[indexPath.row].numOfElements != 1 {
                viewModel.selectedCartProducts[indexPath.row].numOfElements =  viewModel.selectedCartProducts[indexPath.row].numOfElements - 1
                tableView.reloadRows(at: [indexPath], with: .automatic)
                calculateTotalPrice()
            }
    }
    
    
}
