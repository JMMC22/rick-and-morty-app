//
//  FavoritesCharactersLocalDatasource.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol FavoritesCharactersLocalDatasource {
    func fetchFavoritesCharacters() -> [String]
    func addFavoriteCharacter(id: String) -> Bool
    func removeFavoriteCharacter(id: String) -> Bool
}

class DefaultFavoritesCharactersLocalDatasource {

    private let localManager: UserDefaultsManager

    init(localManager: UserDefaultsManager) {
        self.localManager = localManager
    }
}

extension DefaultFavoritesCharactersLocalDatasource: FavoritesCharactersLocalDatasource {

    func fetchFavoritesCharacters() -> [String] {
        guard let result: [String] = localManager.get(for: .favoritesCharacters) else {
            return []
        }

        return result
    }

    func addFavoriteCharacter(id: String) -> Bool {
        var favorites = fetchFavoritesCharacters()

        guard !favorites.contains(id) else {
            return false
        }

        favorites.append(id)
        localManager.set(favorites, for: .favoritesCharacters)

        return true
    }

    func removeFavoriteCharacter(id: String) -> Bool {
        var favorites = fetchFavoritesCharacters()

        guard let index = favorites.firstIndex(where: { $0 == id }) else {
            return false
        }

        favorites.remove(at: index)
        localManager.set(favorites, for: .favoritesCharacters)

        return true
    }
}
