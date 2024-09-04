//
//  CharacterDetailsViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {

    private let id: String

    init(id: String) {
        self.id = id
    }
}
