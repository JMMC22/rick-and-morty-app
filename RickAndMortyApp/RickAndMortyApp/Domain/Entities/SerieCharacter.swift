//
//  SerieCharacter.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

struct SerieCharacter: Identifiable {
    let id: String
    let name: String
    let status: String
    let species: String
    let gender: SerieCharacterGender
    let origin: SerieCharacterOrigin
    let imageURL: URL?
    var isFavorite: Bool
}
