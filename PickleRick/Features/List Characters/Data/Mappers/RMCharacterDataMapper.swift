//
//  RMCharacterDataMapper.swift
//  PickleRick
//
//  Created by Admin on 15/08/2024.
//

import Foundation

class RMCharacterDataMapper {
    static func map(fetchRMCharactersResponse response: Any) -> [RMCharacter] {
        var result = [RMCharacter]()
        guard let responseAsDic = response as? [String: Any],
              let resultsDic = responseAsDic["results"] as? [[String: Any]] else {
            return result
        }
        
        for characterInfo in resultsDic {
            let name = characterInfo.getString("name")
            let status = characterInfo.getString("status")
            let species = characterInfo.getString("species")
            let gender = characterInfo.getString("gender")
            let image = characterInfo.getString("image")
            let rmCharacter = RMCharacter(name: name,
                                          status: status,
                                          species: species,
                                          gender: gender,
                                          image: image)
            
            result.append(rmCharacter)
        }
        
        return result
    }
}
