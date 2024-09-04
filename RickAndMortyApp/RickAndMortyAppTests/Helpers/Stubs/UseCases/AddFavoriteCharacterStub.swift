//
//  AddFavoriteCharacterStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class AddFavoriteCharacterStub: AddFavoriteCharacter {

    let result: Bool

    init(result: Bool) {
        self.result = result
    }

    func execute(id: String) -> Bool {
        result
    }
}
