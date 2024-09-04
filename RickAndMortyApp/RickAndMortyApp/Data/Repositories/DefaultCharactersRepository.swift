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

    func fetchCharacters(page: Int, gender: SerieCharacterGender?) async -> Result<[SerieCharacter], AppError> {
        let result = await remoteDatasource.fetchCharacters(page: page, gender: gender?.rawValue)
        let favorites = favoritesDatasource.fetchFavoritesCharacters()

        switch result {
        case .success(let response):
            let characters = response.data.characters.results.map({ $0.toDomain() })

            let mappedCharacters = characters.map { character in
                var tempCharacter = character
                tempCharacter.isFavorite = favorites.contains(tempCharacter.id)
                return tempCharacter
            }

            return .success(mappedCharacters)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }

    func fetchCharacter(id: String) async -> Result<SerieCharacter, AppError> {
        let result = await remoteDatasource.fetchCharacter(id: id)
        let favorites = favoritesDatasource.fetchFavoritesCharacters()

        switch result {
        case .success(let response):
            var character = response.data.character.toDomain()

            character.isFavorite = favorites.contains(character.id)

            return .success(character)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }
}
