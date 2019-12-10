//
//  RequestExecuterCreatorFactory.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

public class RequestExecuterCreatorFactory: RequestExecuterCreator {
    public init() {}
    public func create(session: URLSession, apiURL: URL, requestConfig: RequestConfig, parameters: [String: Any]?, paramEncoder: ParameterEncoder?,  onComplete: @escaping onComplete, onFailure: @escaping onFailure) throws -> URLRequestExecuter {
        let requestExecuter = try URLSessionRequestExecuter(session: session, url: apiURL, requestConfig: requestConfig, parameters: parameters, parameterEncoder: paramEncoder, onComplete: onComplete, onFailure: onFailure)
        return requestExecuter
    }
}
