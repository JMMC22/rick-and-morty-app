//
//  FetchCharactersStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class FetchCharactersStub: FetchCharacters {

    let result:  Result<[SerieCharacter], AppError>

    init(result: Result<[SerieCharacter], AppError>) {
        self.result = result
    }

    func execute(page: Int, gender: SerieCharacterGender?) async -> Result<[SerieCharacter], AppError> {
        result
    }
}
