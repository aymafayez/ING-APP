//
//  MarketplaceHomeCellDelegate.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

protocol MarketplaceHomeCellDelegate: AnyObject {
    func didAddToCart(at indexPath: IndexPath)
    func didRemoveFromCart(at indexPath: IndexPath)
    
}
