//
//  MarketplaceViewModel.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

class MarketplaceHomeViewModel: BaseViewModel {
    
    
    override init() {
        
    }
    
    func getFarmProducts() -> [FarmProduct] {
        return [FarmProduct]()
    }
    
    func getSeedsProducts() -> [SeedsProduct] {
        return [SeedsProduct]()
    }
    
    func getAllProducts() -> [Product]? {
        let eggsImage = UIImage(named: "Eggs")
        let milkImage = UIImage(named: "Milk")
        let peasImage = UIImage(named: "Peas")
        let beansImage = UIImage(named: "Beans")
        let egg = Product(name: "Egg", image: eggsImage , price: 0.73 , currency: .EUR, unit: .dozen)
        let milk = Product(name: "Milk", image: milkImage, price: 1.4, currency: .EUR, unit: .bottle)
        let peas = Product(name: "Peas", image: peasImage, price: 0.95, currency: .EUR, unit: .bag)
        let beans = Product(name: "Beans", image: beansImage, price: 0.73, currency: .EUR, unit: .can)
        return [egg, milk, peas, beans]
    }
    
}
