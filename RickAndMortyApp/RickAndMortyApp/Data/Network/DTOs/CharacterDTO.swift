//
//  CharacterDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct CharacterDTO: Decodable {
    let id: String
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: CharacterOriginDTO
    let image: String
}
