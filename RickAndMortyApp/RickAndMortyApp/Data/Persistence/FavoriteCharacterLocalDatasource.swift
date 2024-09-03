//
//  FavoriteCharacterLocalDatasource.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol FavoriteCharacterLocalDatasource {
    func fetchFavoritesCharacters() -> Result<[String], UserDefaultsError>
    func isFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError>
    func addFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError>
    func removeFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError>
}

class DefaultFavoriteCharacterLocalDatasource{

    private let localManager: UserDefaultsManager

    init(localManager: UserDefaultsManager) {
        self.localManager = localManager
    }
}

extension DefaultFavoriteCharacterLocalDatasource: FavoriteCharacterLocalDatasource {

    func fetchFavoritesCharacters() -> Result<[String], UserDefaultsError> {
        guard let result: [String] = localManager.get(for: .favoritesCharacters) else {
            return .failure(.keyNotFound)
        }

        return .success(result)
    }

    func isFavoriteCharacter(id: String) -> Result<Bool, UserDefaultsError> {
        let result = fetchFavoritesCharacters()

        switch result {
        case .success(let favorites):
            let isFavorite = favorites.contains(id)
            return .success(isFavorite)
        case .failure(let error):
            return .failure(error)
        }
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
