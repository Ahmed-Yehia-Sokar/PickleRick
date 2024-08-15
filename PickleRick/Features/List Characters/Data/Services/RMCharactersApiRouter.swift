//
//  RMCharactersApiRouter.swift
//  PickleRick
//
//  Created by Admin on 15/08/2024.
//

import Foundation
import Alamofire

enum RMCharactersApiRouter: ApiRouterContract {
    case fetchRMCharacters(pageNumber: Int)
    
    var method: HTTPMethod {
        switch self {
        case .fetchRMCharacters:
            return .get
        }
    }
    var path: String {
        switch self {
        case .fetchRMCharacters(let pageNumber):
            return "\(ApiConstants.webserviceUrl)/character/?page=\(pageNumber)"
        }
    }
}
