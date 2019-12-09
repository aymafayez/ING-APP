//
//  BaseAPI.swift
//  ING APP
//
//  Created by Guest2 on 12/8/19.
//  Copyright © 2019 ING. All rights reserved.
//

import Foundation

public class BaseAPI<RequestModel: Encodable, ResponseModel: Decodable>: BaseAPIProtocol {
    
    var requestDTO: RequestModel?
    var onSuccess: ((ResponseModel?) -> Void)?
    var onAPIError: ((Error) -> Void)?
    var onConnectionError: ((Error) -> Void)?
    var requestExecuterCreator: RequestExecuterCreator
    
    
    public init (requestDTO: RequestModel?, onSuccess: ((ResponseModel?) -> Void)?, onAPIError: ((Error) -> Void)?, onConnectionError: ((Error) -> Void)?, requestExecuterCreator: RequestExecuterCreator = RequestExecuterCreatorFactory()) {
        self.requestDTO = requestDTO
        self.onSuccess = onSuccess
        self.onAPIError = onAPIError
        self.onConnectionError = onConnectionError
        self.requestExecuterCreator = requestExecuterCreator
        BaseAPI.configuration = APIManagerConfiguration(serverUrl: URL(string:"http://data.fixer.io/")!)
    }
    

    // NOTE: To be overriden if needed
    var httpMethod: HTTPMethod { return .get }
    // NOTE: To be overriden if needed
    var relativeApiPath: String { return "" }
    // NOTE: To be overriden if needed
    var paramEncoder: ParameterEncoder?
    // NOTE: To be overriden if needed
    var session: URLSession { return URLSession.shared }
    var httpHeaderFields: [String: String]?
    
    private final func createAPIURL() -> URL {
        return URL(string: self.relativeApiPath, relativeTo: BaseAPI.configuration.serverUrl)!
    }
    
    private final func createAPIParameters() -> [String: Any] {
        let body = requestDTO.dictionary ?? [String: Any]()
        return body
    }
    
    private final func createRequestConfig() -> RequestConfig {
        return RequestConfig(httpMethod: self.httpMethod, allHTTPHeaderFields: self.httpHeaderFields)
    }
    
    // NOTE: This method should not be overriden since it determines the execution pipline
    public func execute() {
        // check for access token and aesKey before starting the reques
        // Prepare request url, data, encryption, request attributes...
        let apiURL = self.createAPIURL()
        let body = self.createAPIParameters()
        
        do {
            let requestExecuter = try self.requestExecuterCreator.create(session: self.session, apiURL: apiURL, requestConfig: self.createRequestConfig(), parameters: body, paramEncoder: self.paramEncoder, onComplete: { (data, response) in
                let decoder = JSONDecoder()
                switch response.statusCode {
                case 200..<300:
                    guard let responseData = data else {
                        return
                    }
                    do {
                        let dto = try decoder.decode(ResponseModel.self, from: responseData)
                        self.processResponse(response: dto)
                    } catch {
                        // TODO: Handle DTO parsing error
                        print(error.localizedDescription)
                    }
                    
                default:
                   break
                }
            }, onFailure: { (error) in
                self.handleConnectionError(error:error)
            })
            requestExecuter.execute()
        } catch {
            // TODOL What to do here
            print("Failed to encode request")
        }
    }
    
    // NOTE: To be overriden if needed
    func processResponse(response: ResponseModel?) {
        // Unencrypt and/or Convert response json object to the corresponding DTO type and pass it to onSuccess() closure
        if let successClosure = self.onSuccess {
            DispatchQueue.main.async {
                successClosure(response)
            }
        }
    }
    
    // NOTE: This method should not be overriden since it will handle common errors
    final func handleAPIError(error: Error) {
        // TODO: Fire error actions (Logs, force logout on certain general errors...) and call onFailure() closure
        if let errorClosure = self.onAPIError {
            DispatchQueue.main.async {
                errorClosure(error)
            }
        }
    }
    
    // NOTE: To be overriden if needed
    func handleConnectionError(error: Error) {
        if let errorClosure = self.onConnectionError {
            DispatchQueue.main.async {
                errorClosure(error)
            }
        }
    }

}

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any]
    }
}
