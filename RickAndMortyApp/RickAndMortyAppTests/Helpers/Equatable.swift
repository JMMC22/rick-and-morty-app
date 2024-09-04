//
//  Equatable.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

extension SerieCharactersResponseDTO: Equatable {
    public static func == (lhs: SerieCharactersResponseDTO, rhs: SerieCharactersResponseDTO) -> Bool {
        return lhs.data == rhs.data
    }
}

extension SerieCharactersDataDTO: Equatable {
    public static func == (lhs: SerieCharactersDataDTO, rhs: SerieCharactersDataDTO) -> Bool {
        return lhs.characters == rhs.characters
    }
}

extension SerieCharactersResultsDTO: Equatable {
    public static func == (lhs: SerieCharactersResultsDTO, rhs: SerieCharactersResultsDTO) -> Bool {
        return lhs.results == rhs.results
    }
}

extension SerieCharacterDTO: Equatable {
    public static func == (lhs: SerieCharacterDTO, rhs: SerieCharacterDTO) -> Bool {
        return lhs.id == rhs.id
    }
}

extension SerieCharacter: Equatable {
    public static func == (lhs: SerieCharacter, rhs: SerieCharacter) -> Bool {
        return lhs.id == rhs.id
    }
}

extension SerieCharacterDetailsResponseDTO: Equatable {
    public static func == (lhs: RickAndMortyApp.SerieCharacterDetailsResponseDTO, rhs: RickAndMortyApp.SerieCharacterDetailsResponseDTO) -> Bool {
        return lhs.data == rhs.data
    }
}

extension SerieCharacterDetailsDataDTO: Equatable {
    public static func == (lhs: SerieCharacterDetailsDataDTO, rhs: SerieCharacterDetailsDataDTO) -> Bool {
        return lhs.character == rhs.character
    }
}

extension RequestError: Equatable {
    public static func == (lhs: RequestError, rhs: RequestError) -> Bool {
        switch (lhs, rhs) {
        case (.error(let lhsStatusCode, let lhsData), .error(let rhsStatusCode, let rhsData)):
            return lhsStatusCode == rhsStatusCode && lhsData == rhsData
        case (.decode, .decode):
            return true
        case (.invalidURL, .invalidURL):
            return true
        case (.noResponse, .noResponse):
            return true
        case (.unauthorized, .unauthorized):
            return true
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
}
