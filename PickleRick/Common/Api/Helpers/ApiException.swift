//
//  ApiException.swift
//  PickleRick
//
//  Created by Admin on 14/08/2024.
//

import Foundation

struct ApiException: Error {
    // MARK: - properties
    private(set) var statusCode: ApiStatusCode,
                     description: String
    
    // MARK: - public methods
    init(statusCode: ApiStatusCode) {
        self.statusCode = statusCode
        self.description = statusCode.description
    }
}
