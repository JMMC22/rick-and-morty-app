//
//  RemoveFavoriteCharacter.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

protocol RemoveFavoriteCharacter {
    func execute(id: String) -> Bool
}

class DefaultRemoveFavoriteCharacter {

    private let favoritesRepository: FavoritesCharactersRepository

    init(favoritesRepository: FavoritesCharactersRepository) {
        self.favoritesRepository = favoritesRepository
    }
}

extension DefaultRemoveFavoriteCharacter: RemoveFavoriteCharacter {

    func execute(id: String) -> Bool {
        return favoritesRepository.removeFavoriteCharacter(id: id)
    }
}
