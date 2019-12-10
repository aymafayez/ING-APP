//
//  MarketPlaceRouter.swift
//  ING APP
//
//  Created by Guest2 on 12/10/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

class MarketPlaceRouter: MarketPlaceRouterProtocol {

    func start(navigationController: UINavigationController) {
        let vm = MarketplaceHomeViewModel()
        let vc = MarketplaceHomeViewController(viewModel: vm, router: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func next(from viewController: UIViewController, selectedElements: [CartElement]) {
        let vm = CheckoutViewModel(selectedCartProducts: selectedElements)
        let vc = CheckoutViewController(viewModel: vm, router: self)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func back(from viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func terminate() {
        
    }
    
}
