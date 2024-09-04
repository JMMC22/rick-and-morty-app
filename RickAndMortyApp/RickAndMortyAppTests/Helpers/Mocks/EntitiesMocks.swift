//
//  EntitiesMocks.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

extension SerieCharacter {
    static var mockedDataList: [SerieCharacter] {
        [
            SerieCharacter(id: "41", name: "Big Boobed Waitress", status: "Alive", species: "Mythological", gender: .female,
                           origin: SerieCharacterOrigin(name: "Fantasy World"), imageURL: URL(string: "www.image.com"), isFavorite: false),
            SerieCharacter(id: "42", name: "Big Head Morty", status: "unknown", species: "Human", gender: .male,
                           origin: SerieCharacterOrigin(name: "unknown"), imageURL: URL(string: "www.image.com"), isFavorite: false)
        ]
    }

    static var mockedData: SerieCharacter {
        SerieCharacter(id: "41", name: "Big Boobed Waitress", status: "Alive", species: "Mythological", gender: .female,
                       origin: SerieCharacterOrigin(name: "Fantasy World"), imageURL: URL(string: "www.image.com"), isFavorite: false)
    }
}
