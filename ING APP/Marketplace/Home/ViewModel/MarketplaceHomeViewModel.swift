//
//  MarketplaceViewModel.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class MarketplaceHomeViewModel: BaseViewModel {
    
    
    override init() {
        
    }
    
    func getFarmProducts() -> [FarmProduct] {
        return [FarmProduct]()
    }
    
    func getSeedsProducts() -> [SeedsProduct] {
        return [SeedsProduct]()
    }
    
    func getAllProducts() -> [Product] {
        let egg = Product(name: "Egg", price: 0.73 , currency: .EUR, unit: .dozen)
        let milk = Product(name: "Milk", price: 1.4, currency: .EUR, unit: .bottle)
        let peas = Product(name: "Peas", price: 0.95, currency: .EUR, unit: .bag)
        let beans = Product(name: "Beans", price: 0.73, currency: .EUR, unit: .can)
        return [egg, milk, peas, beans]
    }
    
}
