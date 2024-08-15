//
//  Bindable.swift
//  PickleRick
//
//  Created by Admin on 14/08/2024.
//

import Foundation

class Bindable<T> {
    // MARK: - properties
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    var observer: ((T?) -> ())?
    
    // MARK: - public methods
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
