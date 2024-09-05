//
//  CharactersListFilter.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 5/9/24.
//

import Foundation

enum CharactersListFilter {
    case all
    case gender(SerieCharacterGender)
}

extension CharactersListFilter {

    var key: String {
        switch self {
        case .all:
            return FilterOption.all.key
        case .gender(let gender):
            return gender.rawValue
        }
    }

    var value: String {
        switch self {
        case .all:
            return FilterOption.all.value
        case .gender(let gender):
            return gender.localized
        }
    }

    var option: FilterOption {
        FilterOption(key: key, value: value)
    }
}

extension CharactersListFilter {

    static func buildFilters() -> [FilterOption] {
        let filters: [CharactersListFilter] = [.all] + SerieCharacterGender.allCases.map { .gender($0) }
        return filters.map { $0.option }
    }
}
