//
//  AddFavoriteCharacter.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

protocol AddFavoriteCharacter {
    func execute(id: String) -> Bool
}

class DefaultAddFavoriteCharacter {

    private let favoritesRepository: FavoritesCharactersRepository

    init(favoritesRepository: FavoritesCharactersRepository) {
        self.favoritesRepository = favoritesRepository
    }
}

extension DefaultAddFavoriteCharacter: AddFavoriteCharacter {

    func execute(id: String) -> Bool {
        return favoritesRepository.addFavoriteCharacter(id: id)
    }
}
