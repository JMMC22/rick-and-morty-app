//
//  CharactersResponseDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct CharactersResponseDTO: Decodable {
    let characters: CharactersDataDTO
}

struct CharactersDataDTO: Decodable {
    let results: [CharacterDTO]
}
