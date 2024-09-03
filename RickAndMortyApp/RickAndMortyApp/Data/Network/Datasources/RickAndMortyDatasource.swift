//
//  RickAndMortyDatasource.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol RickAndMortyDatasource {
    func fetchCharacters(page: Int) async -> Result<RickAndMortyCharactersResponseDTO, RequestError>
}

class DefaultRickAndMortyDatasource {

    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
}

extension DefaultRickAndMortyDatasource: RickAndMortyDatasource {

    func fetchCharacters(page: Int) async -> Result<RickAndMortyCharactersResponseDTO, RequestError> {
        let request = RickAndMortyCharactersRequestDTO(page: page)
        let endpoint = RickAndMortyEndpoint.characters(query: request.query)

        let result = await httpClient.request(endpoint: endpoint)

        switch result {
        case .success(let response):
            guard let response = try? JSONDecoder().decode(RickAndMortyCharactersResponseDTO.self,
                                                           from: response) else {
                return .failure(.decode)
            }

            return .success(response)
        case .failure(let error):
            return .failure(error)
        }
    }
}
