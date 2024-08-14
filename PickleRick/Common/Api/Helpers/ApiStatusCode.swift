//
//  ApiStatusCode.swift
//  PickleRick
//
//  Created by Admin on 14/08/2024.
//

import Foundation

enum ApiStatusCode: Int {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case notAcceptable = 406
    case serverError = 500
    case success = 200
    case unknown = -1
    case noInternetConnection = -2
    
    var description: String {
        switch self {
        case .badRequest:
            return "Bad Request"
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            return "Not Found"
        case .notAcceptable:
            return "Not Acceptable"
        case .serverError:
            return "Server Error"
        case .success:
            return "Success"
        case .noInternetConnection:
            return "Check your internet connection"
        default:
            return "Oops! Something went wrong!"
        }
    }
}
