//
//  MarketplaceHomeViewController + MarketBlaceCellDelegate.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

extension MarketplaceHomeViewController: MarketplaceHomeCellDelegate {
    func didAddToCart(at indexPath: IndexPath) {
             viewModel.cartElementsList[indexPath.row].numOfElements = viewModel.cartElementsList[indexPath.row].numOfElements + 1
            tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    func didRemoveFromCart(at indexPath: IndexPath) {
            if viewModel.cartElementsList[indexPath.row].numOfElements != 0 {
                            viewModel.cartElementsList[indexPath.row].numOfElements = viewModel.cartElementsList[indexPath.row].numOfElements - 1
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        
    }
    
    
}
