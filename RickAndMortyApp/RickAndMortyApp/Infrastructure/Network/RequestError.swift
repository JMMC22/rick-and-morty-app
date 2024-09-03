//
//  RequestError.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

enum RequestError: Error {
    case error(statusCode: Int, data: Data?)
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
}

extension RequestError {

    var localizedDescription: String {
        switch self {
        case .error(let statusCode, _):
            return "Error with status code: \(statusCode)"
        case .decode:
            return "Failed to decode the response."
        case .invalidURL:
            return "The URL provided is invalid."
        case .noResponse:
            return "No response received from the server."
        case .unauthorized:
            return "Unauthorized access - please check your credentials."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
