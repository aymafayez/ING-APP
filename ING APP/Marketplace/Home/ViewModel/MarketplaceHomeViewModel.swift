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
    
    
    
    var productsDic = [Product: Int]()
    private(set) internal var  cartElementsList = [CartElement]()
    var selectedElements: [CartElement] {
        var _selectedElements = [CartElement]()
        for element in cartElementsList {
            if element.numOfElements > 0 {
                _selectedElements.append(element)
            }
        }
        return _selectedElements
    }
    
    override init() {
        super.init()
        if let productsList = getListOfProducts() {
            for i in 0 ..< productsList.count {
                let cartElement = CartElement(product: productsList[i], numOfElements: 0)
                cartElementsList.append(cartElement)
            }
        }
    }
    
    private func getListOfProducts() -> [Product]? {
        // It will get products from API
        let eggsImage = UIImage(named: "Eggs")
        let milkImage = UIImage(named: "Milk")
        let peasImage = UIImage(named: "Peas")
        let beansImage = UIImage(named: "Beans")
        let egg = Egg(serialNum: "#1", name: "Egg", image: eggsImage, price: 0.73)
        let milk = Milk(serialNum: "#2", name: "Milk", image: milkImage, price: 1.4)
        let peas = Peas(serialNum: "#3", name: "Peas", image: peasImage, price: 0.95)
        let beans = Beans(serialNum: "#4", name: "Beans", image: beansImage, price: 0.73)
        return [egg, milk, peas, beans]
    }
    
    
    
}
