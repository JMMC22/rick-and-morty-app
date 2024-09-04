//
//  SerieCharacterDetailsRequestDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

struct SerieCharacterDetailsRequestDTO: Codable {

    let id: String

    init(id: String) {
        self.id = id
    }

    var query: String {
        return """
        {
          character(id: \(id)) {
            id
            name
            status
            species
            gender
            origin {
                name
            }
            image
          }
        }
        """
    }
}
