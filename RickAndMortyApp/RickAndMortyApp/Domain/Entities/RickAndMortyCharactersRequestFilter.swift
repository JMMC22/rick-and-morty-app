//
//  CharactersRequestFilterDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct RickAndMortyCharactersRequestFilter {
    let gender: RickAndMortyCharacterGender?
}

extension RickAndMortyCharactersRequestFilter {

    func buildFilters() -> String {
        var filterComponents: [String] = []

        if let gender = gender {
            filterComponents.append(buildFilterComponent(name: "gender", value: gender.rawValue))
        }
        
        return filterComponents.isEmpty ? "" : "filter: { \(filterComponents.joined(separator: ", ")) }"
    }

    private func buildFilterComponent(name: String, value: String) -> String {
        return "\(name): \"\(value)\""
    }
}
