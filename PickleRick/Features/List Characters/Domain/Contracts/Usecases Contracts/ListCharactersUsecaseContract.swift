//
//  ListCharactersUsecaseContract.swift
//  PickleRick
//
//  Created by Admin on 16/08/2024.
//

import Foundation

protocol ListCharactersUsecaseContract {
    func fetchRMCharacters(pageNumber: Int,
                           completionHandler: @escaping ([RMCharacter]) -> Void,
                           errorHandler: @escaping (String) -> Void)
}
