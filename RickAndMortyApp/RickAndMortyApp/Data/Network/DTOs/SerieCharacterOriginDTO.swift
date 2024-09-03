//
//  SerieCharacterOriginDTO.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct SerieCharacterOriginDTO: Decodable {
    let name: String
}

extension SerieCharacterOriginDTO {
    func toDomain() -> SerieCharacterOrigin {
        SerieCharacterOrigin(name: name)
    }
}
