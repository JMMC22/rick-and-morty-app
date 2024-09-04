//
//  DefaultFavoritesCharactersRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

class DefaultFavoritesCharactersRepository {

    private let localDatasource: FavoritesCharactersLocalDatasource

    init(localDatasource: FavoritesCharactersLocalDatasource) {
        self.localDatasource = localDatasource
    }
}

extension DefaultFavoritesCharactersRepository: FavoritesCharactersRepository {

    func getFavoritesCharactersIds() -> [String] {
        return localDatasource.fetchFavoritesCharacters()
    }

    func addFavoriteCharacter(id: String) -> Bool{
        return localDatasource.addFavoriteCharacter(id: id)
    }

    func removeFavoriteCharacter(id: String) -> Bool {
        return localDatasource.removeFavoriteCharacter(id: id)
    }
}
