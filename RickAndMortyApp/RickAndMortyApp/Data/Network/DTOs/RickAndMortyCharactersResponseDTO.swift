//
//  CharactersResponseDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct RickAndMortyCharactersResponseDTO: Decodable {
    let data: RickAndMortyCharactersDataDTO
}

struct RickAndMortyCharactersDataDTO: Decodable {
    let characters: RickAndMortyCharactersResultsDTO
}

struct RickAndMortyCharactersResultsDTO: Decodable {
    let results: [RickAndMortyCharacterDTO]
}
