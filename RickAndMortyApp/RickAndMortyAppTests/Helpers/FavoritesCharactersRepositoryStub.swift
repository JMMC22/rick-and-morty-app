//
//  FavoritesCharactersRepositoryStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class FavoritesCharactersRepositoryStub: FavoritesCharactersRepository {

    private let result: Bool

    init(result: Bool) {
        self.result = result
    }

    func addFavoriteCharacter(id: String) -> Bool {
        result
    }
    
    func removeFavoriteCharacter(id: String) -> Bool {
        result
    }
}
