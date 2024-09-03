//
//  DefaultCharactersRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

class DefaultCharactersRepository {

    private let remoteDatasource: CharactersRemoteDatasource
    private let favoritesDatasource: FavoritesCharactersLocalDatasource
    private let errorMapper: AppErrorMapper

    init(remoteDatasource: CharactersRemoteDatasource,
         favoritesDatasource: FavoritesCharactersLocalDatasource,
         errorMapper: AppErrorMapper) {
        self.remoteDatasource = remoteDatasource
        self.favoritesDatasource = favoritesDatasource
        self.errorMapper = errorMapper
    }
}

extension DefaultCharactersRepository: CharactersRepository {

    func fetchCharacters(page: Int) async -> Result<[SerieCharacter], AppError> {
        let result = await remoteDatasource.fetchCharacters(page: page)

        switch result {
        case .success(let response):
            let characters = response.data.characters.results.map({ $0.toDomain() })

            let mappedCharacters = characters.map { character in
                var tempCharacter = character
                tempCharacter.isFavorite = isFavoriteCharacter(id: character.id)
                return tempCharacter
            }

            return .success(characters)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }
}

extension DefaultCharactersRepository {

    private func isFavoriteCharacter(id: String) -> Bool {
        let isFavorite = favoritesDatasource.isFavoriteCharacter(id: id)

        switch isFavorite {
        case .success(let isFavorite):
            return isFavorite
        case .failure:
            return false
        }
    }
}