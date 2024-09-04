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

        switch result {
        case .success(let response):
            let characters = response.data.characters.results.map({ $0.toDomain() })

            guard let favorites = try? favoritesDatasource.fetchFavoritesCharacters().get() else {
                return .success(characters)
            }

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
}
