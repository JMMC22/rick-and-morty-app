//
//  FetchFavoritesCharacters.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

protocol FetchFavoritesCharactersIds {
    func execute() -> [String]
}

class DefaultFetchFavoritesCharactersIds {

    private let favoritesRepository: FavoritesCharactersRepository

    init(favoritesRepository: FavoritesCharactersRepository) {
        self.favoritesRepository = favoritesRepository
    }
}

extension DefaultFetchFavoritesCharactersIds: FetchFavoritesCharactersIds {

    func execute() -> [String] {
        return favoritesRepository.getFavoritesCharactersIds()
    }
}
