//
//  FetchCharacters.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol FetchCharacters {
    func execute(page: Int, gender: RickAndMortyCharacterGender?) async -> Result<[RickAndMortyCharacter], RequestError>
}

class DefaultFetchCharacters {

    private let rickAndMortyRepository: RickAndMortyRepository

    init(rickAndMortyRepository: RickAndMortyRepository) {
        self.rickAndMortyRepository = rickAndMortyRepository
    }
}

extension DefaultFetchCharacters: FetchCharacters {

    func execute(page: Int = 1, gender: RickAndMortyCharacterGender? = nil) async -> Result<[RickAndMortyCharacter], RequestError> {
        return await rickAndMortyRepository.fetchCharacters(page: page, gender: gender)
    }
}
