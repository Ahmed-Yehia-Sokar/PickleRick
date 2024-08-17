//
//  ListCharactersUsecase.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import Foundation

class ListCharactersUsecase: ListCharactersUsecaseContract {
    // MARK: - properties
    private let rmCharactersServices: RMCharactersServicesContract
    
    // MARK: - public methods
    init(rmCharactersServices: RMCharactersServicesContract) {
        self.rmCharactersServices = rmCharactersServices
    }
    
    func fetchRMCharacters(pageNumber: Int,
                           status: String,
                           completionHandler: @escaping ([RMCharacter]) -> Void,
                           errorHandler: @escaping (String) -> Void) {
        rmCharactersServices.fetchRMCharacters(pageNumber: pageNumber,
                                               status: status,
                                               completionHandler: completionHandler,
                                               errorHandler: errorHandler)
    }
}
