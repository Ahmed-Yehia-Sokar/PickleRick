//
//  ListCharactersUsecaseProvider.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import Foundation

class ListCharactersUsecaseProvider {
    static func provide() -> ListCharactersUsecase {
        let rmCharactersServices = RMCharactersServicesProvider.provide()
        return ListCharactersUsecase(rmCharactersServices: rmCharactersServices)
    }
}
