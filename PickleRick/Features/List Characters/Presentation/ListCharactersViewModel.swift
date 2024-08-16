//
//  ListCharactersViewModel.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import Foundation

class ListCharactersViewModel {
    // MARK: - properties
    private let listCharactersUsecase: ListCharactersUsecaseContract
    private var currentPage = 1
    private(set) var isPaginationOn = false
    private(set) var dataSource = Bindable<[RMCharacter]>()
    
    // MARK: - public methods
    init(listCharactersUsecase: ListCharactersUsecaseContract) {
        self.listCharactersUsecase = listCharactersUsecase
    }

}
