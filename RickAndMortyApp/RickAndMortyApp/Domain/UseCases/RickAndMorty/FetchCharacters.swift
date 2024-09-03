//
//  FetchCharacters.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol FetchCharacters {
    func execute(page: Int) async -> Result<[SerieCharacter], AppError>
}

class DefaultFetchCharacters {

    private let charactersRepository: CharactersRepository

    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
}

extension DefaultFetchCharacters: FetchCharacters {

    func execute(page: Int = 1) async -> Result<[SerieCharacter], AppError> {
        return await charactersRepository.fetchCharacters(page: page)
    }
}
