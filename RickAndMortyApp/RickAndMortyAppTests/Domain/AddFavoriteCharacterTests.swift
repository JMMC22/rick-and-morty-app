//
//  AddFavoriteCharacterTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

class AddFavoriteCharacterTests: XCTestCase {

    func test_execute_success_when_repository_return_true() {
        // GIVEN
        let stub = FavoritesCharactersRepositoryStub(result: true)
        let sut = DefaultAddFavoriteCharacter(favoritesRepository: stub)

        // WHEN
        let capturedResult = sut.execute(id: "")

        // THEN
        XCTAssertTrue(capturedResult)
    }

    func test_execute_success_when_repository_return_false() {
        // GIVEN
        let stub = FavoritesCharactersRepositoryStub(result: false)
        let sut = DefaultAddFavoriteCharacter(favoritesRepository: stub)

        // WHEN
        let capturedResult = sut.execute(id: "")

        // THEN
        XCTAssertFalse(capturedResult)
    }
}
