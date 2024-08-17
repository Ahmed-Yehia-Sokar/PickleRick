//
//  RMCharacter.swift
//  PickleRick
//
//  Created by Admin on 15/08/2024.
//

import Foundation

struct RMCharacter {
    // MARK: - properties
    let name: String,
        status: String,
        species: String,
        gender: String,
        image: String,
        location: String
    
#if DEBUG
    static let example = RMCharacter(name: "Rick",
                                     status: "Alive",
                                     species: "Human",
                                     gender: "Male",
                                     image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", 
                                     location: "Earth")
#endif
}
