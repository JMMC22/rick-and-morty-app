//
//  SerieCharacterDetailsResponseDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

struct SerieCharacterDetailsResponseDTO: Decodable {
    let data: SerieCharacterDetailsDataDTO
}

struct SerieCharacterDetailsDataDTO: Decodable {
    let character: SerieCharacterDTO
}
