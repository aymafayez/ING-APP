//
//  URLRequestExecuter.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

public protocol URLRequestExecuter {
    var url: URL { get set }
    var requestConfig: RequestConfig { get set }
    var onComplete: onComplete { get set }
    var onFailure: onFailure { get set }
    func execute()
}

public typealias onComplete = (Data?, HTTPURLResponse) -> Void
public typealias onFailure = (URLError) -> Void
