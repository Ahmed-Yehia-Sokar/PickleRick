//
//  ListCharactersViewModel.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import Foundation

enum FilterOption: String, CaseIterable {
    case all = "All"
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

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
                        filterOption: FilterOption = .all,
                        errorHandler: @escaping (String) -> Void) {
        if isPaginationOn {
            currentPage += 1
            self.isPaginationOn = true
        }
        
        var status = filterOption.rawValue
        
        if filterOption == .all {
            status = ""
        }
        
        listCharactersUsecase.fetchRMCharacters(pageNumber: currentPage,
                                                status: status) { [weak self] newCharactersList in
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
    
    func getFiltersCount() -> Int {
        FilterOption.allCases.count
    }
    
    func getFilter(atIndex index: Int) -> FilterOption {
        FilterOption.allCases[index]
    }
    
    func resetPagination() {
        currentPage = 1
        isPaginationOn = false
        dataSource.value = []
    }
}
