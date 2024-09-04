//
//  RickAndMortyEndpoint.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

enum RickAndMortyEndpoint {
    case characters(query: String)
    case character(query: String)
}

extension RickAndMortyEndpoint: Endpoint {

    var host: String {
        return "rickandmortyapi.com"
    }

    var header: [String : String]? {
        return ["Content-Type": "application/json"]
    }

    var path: String {
        return "/graphql"
    }

    var method: HTTPMethodType {
        return .post
    }

    var body: [String: String]? {
        switch self {
        case .characters(let query),
                .character(let query):
            return ["query": query]
        }
    }

    var queryParameters: [URLQueryItem]? {
        return nil
    }
}
