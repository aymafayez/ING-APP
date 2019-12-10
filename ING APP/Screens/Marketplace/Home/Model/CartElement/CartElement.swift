//
//  CartElement.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class CartElement {
    
    private (set) var product: Product
    var numOfElements: Int
    
    init(product: Product,  numOfElements: Int) {
        self.product = product
        self.numOfElements = numOfElements
    }
}
