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
    
    var localized: String {
        switch self {
        case .male:
            return String(localized: "genre.male")
        case .female:
            return String(localized: "genre.female")
        case .genderless:
            return String(localized: "genre.genderless")
        case .unknown:
            return String(localized: "genre.unknown")
        }
    }
}

extension SerieCharacterGender {
    static func buildFilterOptions() -> [FilterOption] {
        let genreFilters = SerieCharacterGender.allCases.map({ FilterOption(key: $0.rawValue, value: $0.localized )})
        return [FilterOption.all] + genreFilters
    }
}
