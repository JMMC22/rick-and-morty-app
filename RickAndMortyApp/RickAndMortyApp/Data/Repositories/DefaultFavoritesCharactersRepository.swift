//
//  DefaultFavoritesCharactersRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

class DefaultFavoritesCharactersRepository {

    private let localDatasource: FavoritesCharactersLocalDatasource
    private let errorMapper: AppErrorMapper

    init(localDatasource: FavoritesCharactersLocalDatasource, errorMapper: AppErrorMapper) {
        self.localDatasource = localDatasource
        self.errorMapper = errorMapper
    }
}

extension DefaultFavoritesCharactersRepository: FavoritesCharactersRepository {

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
