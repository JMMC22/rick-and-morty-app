//
//  CharactersRemoteDatasource.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol CharactersRemoteDatasource {
    func fetchCharacters(page: Int, gender: String?) async -> Result<SerieCharactersResponseDTO, RequestError>
    func fetchCharacter(id: String) async -> Result<SerieCharacterDetailsResponseDTO, RequestError>
}

class DefaultCharactersRemoteDatasource {

    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
}

extension DefaultCharactersRemoteDatasource: CharactersRemoteDatasource {

    func fetchCharacters(page: Int, gender: String?) async -> Result<SerieCharactersResponseDTO, RequestError> {
        let request = SerieCharactersRequestDTO(page: page, gender: gender)
        let endpoint = RickAndMortyEndpoint.characters(query: request.query)

        let result = await httpClient.request(endpoint: endpoint)

        switch result {
        case .success(let response):
            guard let response = try? JSONDecoder().decode(SerieCharactersResponseDTO.self,
                                                           from: response) else {
                return .failure(.decode)
            }

            return .success(response)
        case .failure(let error):
            return .failure(error)
        }
    }

    func fetchCharacter(id: String) async -> Result<SerieCharacterDetailsResponseDTO, RequestError> {
        let request = SerieCharacterDetailsRequestDTO(id: id)
        let endpoint = RickAndMortyEndpoint.character(query: request.query)

        let result = await httpClient.request(endpoint: endpoint)

        switch result {
        case .success(let response):
            guard let response = try? JSONDecoder().decode(SerieCharacterDetailsResponseDTO.self,
                                                           from: response) else {
                return .failure(.decode)
            }

            return .success(response)
        case .failure(let error):
            return .failure(error)
        }
    }
}
