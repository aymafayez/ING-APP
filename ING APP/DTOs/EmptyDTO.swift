//
//  EmptyDTO.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

public struct EmptyDTO: Codable, Equatable {
    
    public init() {}
    
    public static func == (lhs: EmptyDTO, rhs: EmptyDTO) -> Bool {
        return true
    }
}
