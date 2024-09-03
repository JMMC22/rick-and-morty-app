//
//  FavoritesCharactersLocalDatasource.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol FavoritesCharactersLocalDatasource {
    func fetchFavoritesCharacters() -> Result<[String], UserDefaultsError>
    func addFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError>
    func removeFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError>
}

class DefaultFavoritesCharactersLocalDatasource {

    private let localManager: UserDefaultsManager

    init(localManager: UserDefaultsManager) {
        self.localManager = localManager
    }
}

extension DefaultFavoritesCharactersLocalDatasource: FavoritesCharactersLocalDatasource {

    func fetchFavoritesCharacters() -> Result<[String], UserDefaultsError> {
        guard let result: [String] = localManager.get(for: .favoritesCharacters) else {
            return .failure(.keyNotFound)
        }

        return .success(result)
    }

    func addFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError> {
        let result = fetchFavoritesCharacters()

        switch result {
        case .success(var favorites):
            favorites.append(id)
            localManager.set(favorites, for: .favoritesCharacters)

            return .success(true)
        case .failure(let error):
            return .failure(error)
        }
    }

    func removeFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError> {
        let result = fetchFavoritesCharacters()

        switch result {
        case .success(var favorites):
            guard let index = favorites.firstIndex(where: { $0 == id }) else {
                return .failure(.unknown)
            }

            favorites.remove(at: index)
            localManager.set(favorites, for: .favoritesCharacters)

            return .success(true)
        case .failure(let error):
            return .failure(error)
        }
    }
}
