//
//  SerieCharactersRequestDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct SerieCharactersRequestDTO: Codable {

    let page: Int
    let filter: String

    init(page: Int, gender: String? = nil) {
        self.page = page
        self.filter = CharactersRequestFilter(gender: gender).buildFilters()
    }

    var query: String {
        return """
        {
          characters(page: \(page), filter: \(filter)) {
            results {
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
        }
        """
    }
}
