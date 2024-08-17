//
//  MockApiClient.swift
//  PickleRickTests
//
//  Created by Admin on 17/08/2024.
//

import Foundation
import Alamofire
@testable import PickleRick

class MockApiClient: ApiClientContract {
    var performRequestCalled = false
    var performRequestSuccessHandler: ((Any) -> Void)?
    var performRequestErrorHandler: ((ApiException) -> Void)?
    
    func performRequest(url: String,
                        parameters: Parameters? = nil,
                        method: HTTPMethod,
                        successHandler: @escaping (Any) -> Void,
                        errorHandler: @escaping (ApiException) -> Void) {
        performRequestCalled = true
        performRequestSuccessHandler = successHandler
        performRequestErrorHandler = errorHandler
    }
}
