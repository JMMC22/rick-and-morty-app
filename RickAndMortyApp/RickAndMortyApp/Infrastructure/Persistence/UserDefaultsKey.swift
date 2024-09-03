//
//  UserDefaultsKey.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

enum UserDefaultsKey: String, CaseIterable {

    case example = "example"

    static var excludedCases: [UserDefaultsKey] = []

    var value : String {
        return self.rawValue
    }
}
