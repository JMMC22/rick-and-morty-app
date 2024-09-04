//
//  DTOMocks.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
@testable import RickAndMortyApp

extension SerieCharactersResponseDTO {
    static var mockedData: SerieCharactersResponseDTO {
        SerieCharactersResponseDTO(data: SerieCharactersDataDTO.mockedData)
    }
}

extension SerieCharactersDataDTO {
    static var mockedData: SerieCharactersDataDTO {
        SerieCharactersDataDTO(characters: SerieCharactersResultsDTO.mockedData)
    }
}

extension SerieCharactersResultsDTO {
    static var mockedData: SerieCharactersResultsDTO {
        SerieCharactersResultsDTO(results: SerieCharacterDTO.mockedDataList)
    }
}

extension SerieCharacterDetailsResponseDTO {
    static var mockedData: SerieCharacterDetailsResponseDTO {
        SerieCharacterDetailsResponseDTO(data: SerieCharacterDetailsDataDTO.mockedData)
    }
}

extension SerieCharacterDetailsDataDTO {
    static var mockedData: SerieCharacterDetailsDataDTO {
        SerieCharacterDetailsDataDTO(character: SerieCharacterDTO.mockedData)
    }
}

extension SerieCharacterDTO {
    static var mockedDataList: [SerieCharacterDTO] {
        [
            SerieCharacterDTO(id: "41", name: "Big Boobed Waitress", status: "Alive", species: "Mythological",
                              gender: "Female", origin: SerieCharacterOriginDTO(name: "Fantasy World"), image: "www.image.com"),
            SerieCharacterDTO(id: "42", name: "Big Head Morty", status: "unknown", species: "Human",
                              gender: "Male", origin: SerieCharacterOriginDTO(name: "unknown"), image: "www.image.com")
        ]
    }

    static var mockedData: SerieCharacterDTO {
        SerieCharacterDTO(id: "41", name: "Big Boobed Waitress", status: "Alive", species: "Mythological",
                          gender: "Female", origin: SerieCharacterOriginDTO(name: "Fantasy World"), image: "www.image.com")
    }
}
