//
//  FetchCharacterStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class FetchCharacterStub: FetchCharacter {

    let result:  Result<SerieCharacter, AppError>

    init(result: Result<SerieCharacter, AppError>) {
        self.result = result
    }

    func execute(id: String) async -> Result<SerieCharacter, AppError> {
        result
    }
}
