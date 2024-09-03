//
//  RickAndMortyRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

class DefaultRickAndMortyRepository {

    private let remoteDatasource: RickAndMortyDatasource

    init(remoteDatasource: RickAndMortyDatasource) {
        self.remoteDatasource = remoteDatasource
    }
}

extension DefaultRickAndMortyRepository: RickAndMortyRepository {

    func fetchCharacters(page: Int, gender: RickAndMortyCharacterGender? = nil) async -> Result<[RickAndMortyCharacter], RequestError> {
        let result = await remoteDatasource.fetchCharacters(page: page, gender: gender?.rawValue)

        switch result {
        case .success(let response):
            let characters = response.data.characters.results.map({ $0.toDomain() })
            return .success(characters)
        case .failure(let error):
            return .failure(error)
        }
    }
}
