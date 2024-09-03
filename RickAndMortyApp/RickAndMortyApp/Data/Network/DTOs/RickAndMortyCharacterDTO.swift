//
//  CharacterDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct RickAndMortyCharacterDTO: Decodable {
    let id: String
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: RickAndMortyCharacterOriginDTO
    let image: String
}

extension RickAndMortyCharacterDTO {
    func toDomain() -> RickAndMortyCharacter {
        RickAndMortyCharacter(id: id,
                              name: name,
                              status: status,
                              species: species,
                              gender: RickAndMortyCharacterGender(rawValue: gender) ?? .unknown,
                              origin: origin.toDomain(),
                              image: image)
    }
}
