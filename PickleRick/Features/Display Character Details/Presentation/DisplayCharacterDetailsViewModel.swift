//
//  DisplayCharacterDetailsViewModel.swift
//  PickleRick
//
//  Created by Admin on 17/08/2024.
//

import Foundation

class DisplayCharacterDetailsViewModel {
    // MARK: - properties
    private let selectedCharacter: RMCharacter
    
    // MARK: - methods
    init(selectedCharacter: RMCharacter) {
        self.selectedCharacter = selectedCharacter
    }
    
    func getImagePath() -> String {
        selectedCharacter.image
    }
    
    func getCharacterName() -> String {
        selectedCharacter.name
    }
    
    func getCharacterStatus() -> String {
        selectedCharacter.status
    }
    
    func getCharacterSpecies() -> String {
        selectedCharacter.species
    }
    
    func getCharacterGender() -> String {
        selectedCharacter.gender
    }
    
    func getCharacterLocation() -> String {
        selectedCharacter.location
    }
}
