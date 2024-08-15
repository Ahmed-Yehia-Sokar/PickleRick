//
//  DictionaryExtension.swift
//  iMovies
//
//  Created by admin on 15/07/2023.
//

import Foundation

extension Dictionary {
    func getString(_ key: Key, defaultValue: String = "") -> String {
        if let value = self[key] as? String {
            return value
        }
        
        return defaultValue
    }
}
