//
//  GetFavoritesCharactersIdsStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class GetFavoritesCharactersIdsStub: GetFavoritesCharactersIds {

    let result:  [String]

    init(result: [String]) {
        self.result = result
    }

    func execute() -> [String] {
        result
    }
}
