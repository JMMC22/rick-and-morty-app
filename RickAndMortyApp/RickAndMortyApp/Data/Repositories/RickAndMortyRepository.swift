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

    func fetchCharacters(page: Int) async -> Result<[RickAndMortyCharacter], RequestError> {
        let result = await remoteDatasource.fetchCharacters(page: page)

        switch result {
        case .success(let response):
            let characters = response.characters.results.map({ $0.toDomain() })
            return .success(characters)
        case .failure(let error):
            return .failure(error)
        }
    }
}