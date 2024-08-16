//
//  ListCharactersViewModelProvider.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import Foundation

class ListCharactersViewModelProvider {
    static func provide() -> ListCharactersViewModel {
        let listCharactersUsecase = ListCharactersUsecaseProvider.provide()
        return ListCharactersViewModel(listCharactersUsecase: listCharactersUsecase)
    }
}
