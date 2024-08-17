//
//  DisplayCharacterDetailsViewModelProvider.swift
//  PickleRick
//
//  Created by Admin on 17/08/2024.
//

import Foundation

class DisplayCharacterDetailsViewModelProvider {
    static func provide(withCharacter character: RMCharacter) -> DisplayCharacterDetailsViewModel {
        DisplayCharacterDetailsViewModel(selectedCharacter: character)
    }
}
