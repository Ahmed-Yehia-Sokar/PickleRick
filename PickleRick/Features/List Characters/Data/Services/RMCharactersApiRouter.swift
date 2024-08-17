//
//  RMCharactersApiRouter.swift
//  PickleRick
//
//  Created by Admin on 15/08/2024.
//

import Foundation
import Alamofire

enum RMCharactersApiRouter: ApiRouterContract {
    case fetchRMCharacters(pageNumber: Int,
                           status: String)
    
    var method: HTTPMethod {
        switch self {
        case .fetchRMCharacters:
            return .get
        }
    }
    var path: String {
        switch self {
        case .fetchRMCharacters:
            return "\(ApiConstants.webserviceUrl)/character"
        }
    }
    var parameters: Parameters {
        switch self {
        case .fetchRMCharacters(let pageNumber,
                                let status):
            return [
                "page": pageNumber,
                "status": status
            ]
        }
    }
}
