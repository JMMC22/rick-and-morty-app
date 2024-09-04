//
//  CharactersRepositoryStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class CharactersRepositoryStub: CharactersRepository {

    let fetchCharactersResult: Result<[SerieCharacter], AppError>
    let fetchCharacterResult: Result<SerieCharacter, AppError>

    init(fetchCharactersResult: Result<[SerieCharacter], AppError> = .failure(.unknown),
         fetchCharacterResult: Result<SerieCharacter, AppError> = .failure(.unknown)) {
        self.fetchCharactersResult = fetchCharactersResult
        self.fetchCharacterResult = fetchCharacterResult
    }

    func fetchCharacters(page: Int, gender: SerieCharacterGender?) async -> Result<[SerieCharacter], AppError> {
        fetchCharactersResult
    }

    func fetchCharacter(id: String) async -> Result<SerieCharacter, AppError> {
        fetchCharacterResult
    }
}
