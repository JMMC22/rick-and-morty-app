//
//  FavoritesCharactersRepositoryStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class FavoritesCharactersRepositoryStub: FavoritesCharactersRepository {

    private let listresult: [String]
    private let result: Bool

    init(listresult: [String] = [], result: Bool = false) {
        self.listresult = listresult
        self.result = result
    }

    func getFavoritesCharactersIds() -> [String] {
        listresult
    }

    func addFavoriteCharacter(id: String) -> Bool {
        result
    }
    
    func removeFavoriteCharacter(id: String) -> Bool {
        result
    }
}
