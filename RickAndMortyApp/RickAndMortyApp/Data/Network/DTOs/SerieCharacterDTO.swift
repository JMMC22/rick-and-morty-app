//
//  SerieCharacterDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct SerieCharacterDTO: Decodable {
    let id: String
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: SerieCharacterOriginDTO
    let image: String
}

extension SerieCharacterDTO {
    func toDomain() -> SerieCharacter {
        SerieCharacter(id: id,
                       name: name,
                       status: status,
                       species: species,
                       gender: SerieCharacterGender(rawValue: gender) ?? .unknown,
                       origin: origin.toDomain(),
                       imageURL: URL(string: image),
                       isFavorite: false)
    }
}
