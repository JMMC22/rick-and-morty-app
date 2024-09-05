//
//  UserDefaultsManager.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol UserDefaultsManager {
    func get<T>(for key: UserDefaultsKey) -> T?
    func set<T>(_ obj: T, for key: UserDefaultsKey)
    func remove(for key: UserDefaultsKey)
}

class DefaultUserDefaultsManager: NSObject, UserDefaultsManager {

    static let shared = DefaultUserDefaultsManager()
    private let userDefaults = UserDefaults.standard
    
    private override init() {
        super.init()
    }
    
    func get<T>(for key: UserDefaultsKey) -> T? {
        return self.userDefaults.object(forKey: key.value) as? T
    }

    func set<T>(_ obj: T, for key: UserDefaultsKey) {
        self.userDefaults.set(obj, forKey: key.value)
    }

    func remove(for key: UserDefaultsKey) {
        self.userDefaults.removeObject(forKey: key.value)
    }
}
