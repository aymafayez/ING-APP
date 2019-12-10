//
//  LatestExchangeRateAPI.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

class LatestExchangeRateAPI: BaseAPI<EmptyDTO,ExchangeRatesDTO> {
    override var relativeApiPath: String {
        return "api/latest?access_key=" + accessKey
        
    }
}
