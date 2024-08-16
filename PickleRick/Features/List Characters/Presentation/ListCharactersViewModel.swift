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
        self.dataSource.value = []
    }
    
    func listCharacters(isPaginationOn: Bool = false,
                        errorHandler: @escaping (String) -> Void) {
        if isPaginationOn {
            currentPage += 1
            self.isPaginationOn = true
        }
        
        listCharactersUsecase.fetchRMCharacters(pageNumber: currentPage) { [weak self] newCharactersList in
            guard let unwrappedSelf = self else { return }
            unwrappedSelf.dataSource.value?.append(contentsOf: newCharactersList)
            unwrappedSelf.isPaginationOn = false
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }
    }
    
    func getCharactersCount() -> Int {
        dataSource.value?.count ?? 0
    }
    
    func getRMCharacter(atIndex index: Int) -> RMCharacter? {
        dataSource.value?[index]
    }
}
