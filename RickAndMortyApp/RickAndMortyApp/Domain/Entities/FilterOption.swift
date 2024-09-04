//
//  FilterOption.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

struct FilterOption: Hashable, Equatable {

    let key: String
    let value: String

    init(key: String, value: String) {
        self.key = key
        self.value = value
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }

    static let all = FilterOption(key: "all", value: "Todos")
}
