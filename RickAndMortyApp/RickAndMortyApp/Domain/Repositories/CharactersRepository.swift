//
//  CharactersRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol CharactersRepository {
    func fetchCharacters(page: Int, gender: SerieCharacterGender?) async -> Result<[SerieCharacter], AppError>
}
