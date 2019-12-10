//
//  ParameterEncoder.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters)  throws
}
