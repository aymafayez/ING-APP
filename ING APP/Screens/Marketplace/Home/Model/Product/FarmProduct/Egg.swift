//
//  Egg.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

class Egg: SeedsProduct {
    override init(serialNum: String, name: String, image: UIImage?, price: Double, currency: Currency = .EUR , unit: Unit = .DOZEN) {
        super.init(serialNum: serialNum, name: name, image: image, price: price, currency: currency, unit: unit)
    }
    
}

