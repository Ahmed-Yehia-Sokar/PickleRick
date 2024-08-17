//
//  RMCharactersServices.swift
//  PickleRick
//
//  Created by Admin on 15/08/2024.
//

import Foundation

class RMCharactersServices: RMCharactersServicesContract {
    // MARK: - properties
    private var apiClient: ApiClient
    
    // MARK: - public methods
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchRMCharacters(pageNumber: Int,
                           status: String,
                           completionHandler: @escaping ([RMCharacter]) -> Void,
                           errorHandler: @escaping (String) -> Void) {
        let rmCharactersApi = RMCharactersApiRouter.fetchRMCharacters(pageNumber: pageNumber, 
                                                                      status: status)
        
        apiClient.performRequest(url: rmCharactersApi.path,
                                 parameters: rmCharactersApi.parameters,
                                 method: rmCharactersApi.method,
                                 successHandler: { response in
            let rmCharactersList = RMCharacterDataMapper.map(fetchRMCharactersResponse: response)
            completionHandler(rmCharactersList)
        },
                                 errorHandler: { exception in
            let errorMessage = exception.description
            errorHandler(errorMessage)
        })
    }
}
