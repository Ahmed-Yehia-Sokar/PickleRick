//
//  ApiClient.swift
//  PickleRick
//
//  Created by Admin on 14/08/2024.
//

import Foundation
import Alamofire

class ApiClient {
    // MARK: - public methods
    func performRequest(url: String,
                        parameters: Parameters? = nil,
                        method: HTTPMethod,
                        successHandler: @escaping (Any) -> Void,
                        errorHandler: @escaping (ApiException) -> Void) {
        checkInternetConnection(errorHandler: errorHandler)
        
        AF.request(url,
                   method: method,
                   parameters: parameters)
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                self.handleSuccessfulResponse(response: response,
                                              data: data,
                                              successHandler: successHandler,
                                              errorHandler: errorHandler)
            case .failure:
                self.handleFailedResponse(response: response,
                                          errorHandler: errorHandler)
            }
        }
    }
    
    // MARK: - private methods
    private func checkInternetConnection(errorHandler: @escaping (ApiException) -> Void) {
        let isConnectedToInternet = NetworkReachabilityManager()?.isReachable ?? false
        
        if !isConnectedToInternet {
            let apiException = ApiException(statusCode: .noInternetConnection)
            errorHandler(apiException)
        }
    }
    
    private func handleSuccessfulResponse(response: AFDataResponse<Data>,
                                          data: Data,
                                          successHandler: @escaping (Any) -> Void,
                                          errorHandler: @escaping (ApiException) -> Void) {
        do {
            let statusCodeFromResponse = response.response?.statusCode ?? -1
            let statusCode = ApiStatusCode(rawValue: statusCodeFromResponse) ?? .unknown
            
            if statusCode == .success {
                let dataAsJSON = try JSONSerialization.jsonObject(with: data)
                successHandler(dataAsJSON)
            } else {
                self.handleFailedResponse(response: response,
                                          errorHandler: errorHandler)
            }
        } catch {
            let apiException = ApiException(statusCode: .unknown)
            errorHandler(apiException)
        }
    }
    
    private func handleFailedResponse(response: AFDataResponse<Data>,
                                      errorHandler: @escaping (ApiException) -> Void) {
        let statusCodeFromResponse = response.response?.statusCode ?? -1
        let statusCode = ApiStatusCode(rawValue: statusCodeFromResponse) ?? .unknown
        let apiException = ApiException(statusCode: statusCode)
        
        errorHandler(apiException)
    }
}
