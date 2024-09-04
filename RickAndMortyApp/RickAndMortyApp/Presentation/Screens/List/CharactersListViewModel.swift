//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {

    private let fetchCharacters: FetchCharacters

    init(fetchCharacters: FetchCharacters) {
        self.fetchCharacters = fetchCharacters
    }
}
