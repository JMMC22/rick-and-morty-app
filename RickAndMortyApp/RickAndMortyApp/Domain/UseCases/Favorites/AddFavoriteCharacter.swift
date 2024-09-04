//
//  AddFavoriteCharacter.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

protocol AddFavoriteCharacter {
    func execute(id: String) -> Result<Bool, AppError>
}

class DefaultAddFavoriteCharacter {

    private let favoritesRepository: FavoritesCharactersRepository

    init(favoritesRepository: FavoritesCharactersRepository) {
        self.favoritesRepository = favoritesRepository
    }
}

extension DefaultAddFavoriteCharacter: AddFavoriteCharacter {

    func execute(id: String) -> Result<Bool, AppError> {
        return favoritesRepository.addFavoriteCharacter(id: id)
    }
}
