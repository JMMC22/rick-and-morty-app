//
//  FetchCharacter.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

protocol FetchCharacter {
    func execute(id: String) async -> Result<SerieCharacter, AppError>
}

class DefaultFetchCharacter {

    private let charactersRepository: CharactersRepository

    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
}

extension DefaultFetchCharacter: FetchCharacter {

    func execute(id: String) async -> Result<SerieCharacter, AppError> {
        return await charactersRepository.fetchCharacter(id: id)
    }
}
