//
//  APIManagerConfiguration.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

public struct APIManagerConfiguration {
    
    public var serverUrl: URL
    
    public init(serverUrl: URL) {
        self.serverUrl = serverUrl
    }
}
