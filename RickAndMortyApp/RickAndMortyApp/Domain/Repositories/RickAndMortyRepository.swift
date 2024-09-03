//
//  RickAndMortyRepository.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

protocol RickAndMortyRepository {
    func fetchCharacters(page: Int) async -> Result<[RickAndMortyCharacter], AppError>
}
