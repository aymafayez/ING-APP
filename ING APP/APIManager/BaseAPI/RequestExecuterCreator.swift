//
//  RequestExecuterCreator.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

public protocol RequestExecuterCreator {
    func create(session: URLSession, apiURL: URL, requestConfig: RequestConfig, parameters: [String: Any]?, paramEncoder: ParameterEncoder?,  onComplete: @escaping onComplete, onFailure: @escaping onFailure) throws -> URLRequestExecuter
}
