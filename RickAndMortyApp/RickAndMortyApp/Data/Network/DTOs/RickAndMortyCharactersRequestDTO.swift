//
//  CharactersRequestDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct RickAndMortyCharactersRequestDTO: Codable {

    let page: Int
    let filter: String

    init(page: Int, filter: RickAndMortyCharactersRequestFilter? = nil) {
        self.page = page
        self.filter = filter?.buildFilters() ?? ""
    }

    var query: String {
        return """
        {
          characters(page: \(page), filter: \(filter) {
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
