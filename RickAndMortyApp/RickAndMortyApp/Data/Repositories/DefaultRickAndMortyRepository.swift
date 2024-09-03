//
//  RickAndMortyRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

class DefaultRickAndMortyRepository {

    private let remoteDatasource: RickAndMortyDatasource
    private let errorMapper: AppErrorMapper

    init(remoteDatasource: RickAndMortyDatasource, errorMapper: AppErrorMapper) {
        self.remoteDatasource = remoteDatasource
        self.errorMapper = errorMapper
    }
}

extension DefaultRickAndMortyRepository: RickAndMortyRepository {

    func fetchCharacters(page: Int) async -> Result<[RickAndMortyCharacter], AppError> {
        let result = await remoteDatasource.fetchCharacters(page: page)

        switch result {
        case .success(let response):
            let characters = response.data.characters.results.map({ $0.toDomain() })
            return .success(characters)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }
}
