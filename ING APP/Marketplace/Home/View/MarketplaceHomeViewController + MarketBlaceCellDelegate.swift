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
        if let _products = products {
            _products[indexPath.row].numOfElements = _products[indexPath.row].numOfElements + 1
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func didRemoveFromCart(at indexPath: IndexPath) {
        if let _products = products {
            if _products[indexPath.row].numOfElements != 0 {
                            _products[indexPath.row].numOfElements = _products[indexPath.row].numOfElements - 1
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    
}
