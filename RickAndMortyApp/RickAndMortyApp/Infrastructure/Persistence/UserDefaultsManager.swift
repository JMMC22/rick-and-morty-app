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
    func object(for key: UserDefaultsKey) -> Any?
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

    func object(for key: UserDefaultsKey) -> Any? {
        return self.userDefaults.object(forKey: key.value)
    }

    static func clean() {
        let keys = UserDefaultsKey.allCases
        keys.forEach {
            let excluded = UserDefaultsKey.excludedCases.contains($0)

            if excluded {
                print("Excluded case: \($0.value)")
            } else {
                DefaultUserDefaultsManager.shared.remove(for: $0)
            }
        }
    }
}
