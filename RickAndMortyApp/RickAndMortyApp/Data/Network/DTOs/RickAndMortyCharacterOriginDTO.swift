//
//  CharacterOriginDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct RickAndMortyCharacterOriginDTO: Decodable {
    let name: String
}

extension RickAndMortyCharacterOriginDTO {
    func toDomain() -> RickAndMortyCharacterOrigin {
        RickAndMortyCharacterOrigin(name: name)
    }
}
