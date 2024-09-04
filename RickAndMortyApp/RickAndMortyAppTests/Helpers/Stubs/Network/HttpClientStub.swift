//
//  HttpClientStub.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

class HTTPCLientStub: HTTPClient {

    private let result: Result<Data, RequestError>

    init(result: Result<Data, RequestError>) {
        self.result = result
    }

    func request(endpoint: Endpoint) async -> Result<Data, RequestError> {
        return result
    }
}
