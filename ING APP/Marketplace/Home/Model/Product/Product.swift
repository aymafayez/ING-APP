//
//  Product.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class Product {
    var name: String
    var price: String
    var currency: Currency
    var unit: Unit
    
    init(name: String, price: String, currency: Currency, unit: Unit) {
        self.name = name
        self.price = price
        self.currency = currency
        self.unit = unit
    }
}

enum Currency: String {
    case USD = "USD"
}

enum unit: String {
    case bag = "bag"
    case dozen = "dozen"
    case can = "can"
    case bottle = "bottle"
}


