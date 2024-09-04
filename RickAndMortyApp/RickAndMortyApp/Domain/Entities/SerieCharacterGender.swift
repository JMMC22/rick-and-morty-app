//
//  SerieCharacterGender.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

enum SerieCharacterGender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown
}

extension SerieCharacterGender {
    static func buildFilterOptions() -> [FilterOption] {
        let genreFilters = SerieCharacterGender.allCases.map({ FilterOption(key: $0.rawValue, value: $0.rawValue )})
        return [FilterOption.all] + genreFilters
    }
}
