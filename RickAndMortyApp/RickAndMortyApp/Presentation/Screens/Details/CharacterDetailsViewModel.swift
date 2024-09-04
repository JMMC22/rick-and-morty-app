//
//  CharacterDetailsViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {

    private let id: String
    private let fetchCharacter: FetchCharacter

    init(id: String, fetchCharacter: FetchCharacter) {
        self.id = id
        self.fetchCharacter = fetchCharacter
    }
}
