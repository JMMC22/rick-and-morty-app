//
//  UserDefaultsManagerStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class UserDefaultsManagerStub: UserDefaultsManager {

    private var storage: [UserDefaultsKey: Any]

    init(storage: [UserDefaultsKey : Any]) {
        self.storage = storage
    }

    func get<T>(for key: UserDefaultsKey) -> T? {
        return storage[key] as? T
    }

    func set<T>(_ obj: T, for key: UserDefaultsKey) {
        storage[key] = obj
    }

    func remove(for key: UserDefaultsKey) {
        storage.removeValue(forKey: key)
    }
}
