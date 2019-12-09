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
             elementsList[indexPath.row].numOfElements = elementsList[indexPath.row].numOfElements + 1
             tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func didRemoveFromCart(at indexPath: IndexPath) {
            if elementsList[indexPath.row].numOfElements != 0 {
                            elementsList[indexPath.row].numOfElements = elementsList[indexPath.row].numOfElements - 1
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
    }
    
}
