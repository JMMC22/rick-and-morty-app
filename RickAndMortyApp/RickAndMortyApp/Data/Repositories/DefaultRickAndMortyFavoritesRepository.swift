//
//  DefaultRickAndMortyFavoritesRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

class DefaultRickAndMortyFavoritesRepository {

    private let localDatasource: RickAndMortyFavoritesLocalDatasource
    private let errorMapper: AppErrorMapper

    init(localDatasource: RickAndMortyFavoritesLocalDatasource, errorMapper: AppErrorMapper) {
        self.localDatasource = localDatasource
        self.errorMapper = errorMapper
    }
}

extension DefaultRickAndMortyFavoritesRepository: RickAndMortyFavoritesRepository {

    func isFavoriteCharacter(id: String) -> Result<Bool, AppError> {
        let result = localDatasource.isFavoriteCharacter(id: id)

        switch result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }

    func addFavoriteCharacter(id: String) -> Result<Bool, AppError> {
        let result = localDatasource.addFavoriteCharacter(id: id)

        switch result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }

    func removeFavoriteCharacter(id: String) -> Result<Bool, AppError> {
        let result = localDatasource.removeFavoriteCharacter(id: id)

        switch result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))

        }
    }
}
