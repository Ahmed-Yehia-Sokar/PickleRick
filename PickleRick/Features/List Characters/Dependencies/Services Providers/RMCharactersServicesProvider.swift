//
//  RMCharactersServicesProvider.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import Foundation

class RMCharactersServicesProvider {
    static func provide() -> RMCharactersServices {
        let apiClient = ApiClient()
        return RMCharactersServices(apiClient: apiClient)
    }
}
