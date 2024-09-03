//
//  CharactersResponseDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct SerieCharactersResponseDTO: Decodable {
    let data: SerieCharactersDataDTO
}

struct SerieCharactersDataDTO: Decodable {
    let characters: SerieCharactersResultsDTO
}

struct SerieCharactersResultsDTO: Decodable {
    let results: [SerieCharacterDTO]
}
