//
//  RMCharactersServicesContract.swift
//  PickleRick
//
//  Created by Admin on 15/08/2024.
//

import Foundation

protocol RMCharactersServicesContract {
    func fetchRMCharacters(pageNumber: Int,
                           completionHandler: @escaping ([RMCharacter]) -> Void,
                           errorHandler: @escaping (String) -> Void)
}
