//
//  CharactersRemoteDatasourceStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class CharactersRemoteDatasourceStub: CharactersRemoteDatasource {

    private let fetchCharactersResult: Result<SerieCharactersResponseDTO, RequestError>
    private let fetchCharacterResult: Result<SerieCharacterDetailsResponseDTO, RequestError>

    init(fetchCharactersResult: Result<SerieCharactersResponseDTO, RequestError> = .failure(.unknown),
         fetchCharacterResult: Result<SerieCharacterDetailsResponseDTO, RequestError> = .failure(.unknown)) {
        self.fetchCharactersResult = fetchCharactersResult
        self.fetchCharacterResult = fetchCharacterResult
    }

    func fetchCharacters(page: Int, gender: String?) async -> Result<SerieCharactersResponseDTO, RequestError> {
        return fetchCharactersResult
    }

    func fetchCharacter(id: String) async -> Result<SerieCharacterDetailsResponseDTO, RequestError> {
        return fetchCharacterResult
    }
}

