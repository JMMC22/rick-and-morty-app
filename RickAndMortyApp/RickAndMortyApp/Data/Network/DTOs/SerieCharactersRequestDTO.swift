//
//  SerieCharactersRequestDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct SerieCharactersRequestDTO: Codable {

    let page: Int

    init(page: Int) {
        self.page = page
    }

    var query: String {
        return """
        {
          characters(page: \(page)) {
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