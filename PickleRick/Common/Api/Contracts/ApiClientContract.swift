//
//  ApiClientContract.swift
//  PickleRick
//
//  Created by Admin on 17/08/2024.
//

import Foundation
import Alamofire

protocol ApiClientContract {
    func performRequest(url: String,
                        parameters: Parameters?,
                        method: HTTPMethod,
                        successHandler: @escaping (Any) -> Void,
                        errorHandler: @escaping (ApiException) -> Void)
}
