//
//  CharactersRequestFilterDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct CharactersRequestFilter {
    let gender: String?
}

extension CharactersRequestFilter {

    func buildFilters() -> String {
        var filterComponents: [String] = []

        filterComponents.append(buildFilterComponent(name: "gender", value: gender ?? ""))

        return filterComponents.isEmpty ? "" : "{ \(filterComponents.joined(separator: ", ")) }"
    }

    private func buildFilterComponent(name: String, value: String) -> String {
        return "\(name): \"\(value)\""
    }
}
