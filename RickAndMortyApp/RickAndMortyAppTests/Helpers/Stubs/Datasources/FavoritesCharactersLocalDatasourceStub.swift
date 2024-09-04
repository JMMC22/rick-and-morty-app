//
//  FavoritesCharactersLocalDatasourceStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class FavoritesCharactersLocalDatasourceStub: FavoritesCharactersLocalDatasource {

    private let listResult: [String]
    private let result: Bool

    init(listResult: [String] = [], result: Bool = true) {
        self.listResult = listResult
        self.result = result
    }

    func fetchFavoritesCharacters() -> [String] {
        listResult
    }

    func addFavoriteCharacter(id: String) -> Bool {
        result
    }

    func removeFavoriteCharacter(id: String) -> Bool {
        result
    }
}
