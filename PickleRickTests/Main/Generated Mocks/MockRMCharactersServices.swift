//
//  MockRMCharactersServices.swift
//  PickleRickTests
//
//  Created by Admin on 17/08/2024.
//

import Foundation
@testable import PickleRick

class MockRMCharactersServices: RMCharactersServicesContract {
    var shouldSucceed = true
    var charactersToReturn = [RMCharacter]()
    var errorToReturn = "Some error occurred"
    
    func fetchRMCharacters(pageNumber: Int,
                           status: String,
                           completionHandler: @escaping ([RMCharacter]) -> Void,
                           errorHandler: @escaping (String) -> Void) {
        if shouldSucceed {
            completionHandler(charactersToReturn)
        } else {
            errorHandler(errorToReturn)
        }
    }
}
