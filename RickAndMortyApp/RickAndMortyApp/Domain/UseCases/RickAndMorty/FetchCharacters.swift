//
//  FetchCharacters.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol FetchCharacters {
    func execute(page: Int) async -> Result<[RickAndMortyCharacter], AppError>
}

class DefaultFetchCharacters {

    private let rickAndMortyRepository: RickAndMortyRepository

    init(rickAndMortyRepository: RickAndMortyRepository) {
        self.rickAndMortyRepository = rickAndMortyRepository
    }
}

extension DefaultFetchCharacters: FetchCharacters {

    func execute(page: Int = 1) async -> Result<[RickAndMortyCharacter], AppError> {
        return await rickAndMortyRepository.fetchCharacters(page: page)
    }
}
