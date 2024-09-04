//
//  GetFavoritesCharactersIds.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

protocol GetFavoritesCharactersIds {
    func execute() -> [String]
}

class DefaultGetFavoritesCharactersIds {

    private let favoritesRepository: FavoritesCharactersRepository

    init(favoritesRepository: FavoritesCharactersRepository) {
        self.favoritesRepository = favoritesRepository
    }
}

extension DefaultGetFavoritesCharactersIds: GetFavoritesCharactersIds {

    func execute() -> [String] {
        return favoritesRepository.getFavoritesCharactersIds()
    }
}
