//
//  MarketPlaceRouterProtocol.swift
//  ING APP
//
//  Created by Guest2 on 12/10/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

protocol MarketPlaceRouterProtocol {
    func start(navigationController: UINavigationController)
    func terminate()
    func next(from viewController: UIViewController, selectedElements: [CartElement])
    func back(from viewController: UIViewController)
}
