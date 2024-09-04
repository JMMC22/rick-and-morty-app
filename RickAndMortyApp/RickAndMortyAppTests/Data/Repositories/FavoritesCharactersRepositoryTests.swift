//
//  FavoritesCharactersRepositoryTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

final class FavoritesCharactersRepositoryTests: XCTestCase {

    func test_addFavoriteCharacter_success_when_local_datasource_return_true() {
        // GIVEN
        let stub = FavoritesCharactersLocalDatasourceStub(result: true)
        let sut = DefaultFavoritesCharactersRepository(localDatasource: stub)

        // WHEN
        let capturedResult = sut.addFavoriteCharacter(id: "1")

        // THEN
        XCTAssertTrue(capturedResult)
    }

    func test_addFavoriteCharacter_success_when_local_datasource_return_false() {
        // GIVEN
        let stub = FavoritesCharactersLocalDatasourceStub(result: false)
        let sut = DefaultFavoritesCharactersRepository(localDatasource: stub)

        // WHEN
        let capturedResult = sut.addFavoriteCharacter(id: "1")

        // THEN
        XCTAssertFalse(capturedResult)
    }
    
    func test_removeFavoriteCharacter_success_when_local_datasource_return_true() {
        // GIVEN
        let stub = FavoritesCharactersLocalDatasourceStub(result: true)
        let sut = DefaultFavoritesCharactersRepository(localDatasource: stub)

        // WHEN
        let capturedResult = sut.removeFavoriteCharacter(id: "1")

        // THEN
        XCTAssertTrue(capturedResult)
    }

    func test_removeFavoriteCharacter_success_when_local_datasource_return_false() {
        // GIVEN
        let stub = FavoritesCharactersLocalDatasourceStub(result: false)
        let sut = DefaultFavoritesCharactersRepository(localDatasource: stub)

        // WHEN
        let capturedResult = sut.removeFavoriteCharacter(id: "1")

        // THEN
        XCTAssertFalse(capturedResult)
    }
}
