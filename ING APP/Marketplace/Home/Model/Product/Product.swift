//
//  Product.swift
//  ING APP
//
//  Created by Guest2 on 12/6/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation
import UIKit

class Product: Hashable, Equatable {
    
    var name: String
    var serialNum: String
    var image: UIImage?
    var price: Double
    var currency: Currency
    var unit: Unit
    
    init(serialNum: String, name: String, image: UIImage?, price: Double, currency: Currency, unit: Unit) {
        self.serialNum = serialNum
        self.name = name
        self.image = image
        self.price = price
        self.currency = currency
        self.unit = unit
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNum)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        if lhs.serialNum == rhs.serialNum {
            return true
        }
        return false
    }
    
    
}

enum Currency: String {
    case AED, AFN, ALL, AMD, ANG, AOA, ARS, AUD, AWG, AZN, BAM, BBD, BDT, BGN, BHD, BIF, BMD, BND, BOB, BRL, BSD, BTN, BWP, BYN, BZD, CAD, CDF, CHF, CLP, CNY, COP, CRC, CUC, CUP, CVE, CZK, DJF, DKK, DOP, DZD, EGP, ERN, ETB, EUR, FJD, FKP, GBP, GEL, GHS, GIP, GMD, GNF, GTQ, GYD, HKD, HNL, HRK, HTG, HUF, IDR, ILS, INR, IQD, IRR, ISK, JMD, JOD, JPY, KES, KGS, KHR, KMF, KPW, KRW, KWD, KYD, KZT, LAK, LBP, LKR, LRD, LSL, LYD, MAD, MDL, MGA, MKD, MMK, MNT, MOP, MRU, MUR, MVR, MWK, MXN, MYR, MZN, NAD, NGN, NIO, NOK, NPR, NZD, OMR, PAB, PEN, PGK, PHP, PKR, PLN, PYG, QAR, RON, RSD, RUB, RWF, SAR, SBD, SCR, SDG, SEK, SGD, SHP, SLL, SOS, SRD, SSP, STN, SYP, SZL, THB, TJS, TMT, TND, TOP, TRY, TTD, TWD, TZS, UAH, UGX, USD, UYU, UZS, VEF, VND, VUV, WST, XAF, XCD, XOF, XPF, YER, ZAR, ZMW
}

enum Unit: String {
    case BAG
    case DOZEN
    case CAN
    case BOTTLE
}





