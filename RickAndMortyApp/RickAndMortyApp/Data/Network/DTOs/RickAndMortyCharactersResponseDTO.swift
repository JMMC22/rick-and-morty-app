//
//  CharactersResponseDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct RickAndMortyCharactersResponseDTO: Decodable {
    let characters: RickAndMortyCharactersDataDTO
}

struct RickAndMortyCharactersDataDTO: Decodable {
    let results: [RickAndMortyCharacterDTO]
}
