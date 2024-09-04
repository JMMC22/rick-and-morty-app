//
//  FavoritesCharactersLocalDatasourceTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

final class FavoritesCharactersLocalDatasourceTests: XCTestCase {

    func test_fetchFavoritesCharacters_success_when_local_storage_returns_correct_array() {
        // GIVEN
        let stub = UserDefaultsManagerStub(storage: [.favoritesCharacters: ["1", "41"]])
        let expectedResult = ["1", "41"]
        let sut = DefaultFavoritesCharactersLocalDatasource(localManager: stub)

        // THEN
        let capturedResult = sut.fetchFavoritesCharacters()

        // WHEN
        XCTAssertEqual(capturedResult, expectedResult)
    }

    func test_fetchFavoritesCharacters_success_when_local_storage_returns_empty_array() {
        // GIVEN
        let stub = UserDefaultsManagerStub(storage: [.favoritesCharacters: []])
        let sut = DefaultFavoritesCharactersLocalDatasource(localManager: stub)

        // THEN
        let capturedResult = sut.fetchFavoritesCharacters()

        // WHEN
        XCTAssertEqual(capturedResult, [])
    }

    func test_fetchFavoritesCharacters_success_when_local_storage_returns_no_key() {
        // GIVEN
        let stub = UserDefaultsManagerStub(storage: [:])
        let sut = DefaultFavoritesCharactersLocalDatasource(localManager: stub)

        // THEN
        let capturedResult = sut.fetchFavoritesCharacters()

        // WHEN
        XCTAssertEqual(capturedResult, [])
    }

    func test_addFavoriteCharacter_success_when_local_storage_save_id_success() {
        // GIVEN
        let stub = UserDefaultsManagerStub(storage: [.favoritesCharacters: []])
        let sut = DefaultFavoritesCharactersLocalDatasource(localManager: stub)

        // THEN
        let capturedResult = sut.addFavoriteCharacter(id: "1")

        // WHEN
        XCTAssertTrue(capturedResult)
    }
    
    func test_addFavoriteCharacter_success_when_local_storage_contains_favorite_character_success() {
        // GIVEN
        let stub = UserDefaultsManagerStub(storage: [.favoritesCharacters: ["1"]])
        let sut = DefaultFavoritesCharactersLocalDatasource(localManager: stub)

        // THEN
        let capturedResult = sut.addFavoriteCharacter(id: "1")

        // WHEN
        XCTAssertFalse(capturedResult)
    }
    
    func test_removeFavoriteCharacter_success_when_local_storage_save_id_success() {
        // GIVEN
        let stub = UserDefaultsManagerStub(storage: [.favoritesCharacters: ["1"]])
        let sut = DefaultFavoritesCharactersLocalDatasource(localManager: stub)

        // THEN
        let capturedResult = sut.removeFavoriteCharacter(id: "1")

        // WHEN
        XCTAssertTrue(capturedResult)
    }
    
    func test_removeFavoriteCharacter_success_when_local_storage_contains_favorite_character_success() {
        // GIVEN
        let stub = UserDefaultsManagerStub(storage: [.favoritesCharacters: ["2"]])
        let sut = DefaultFavoritesCharactersLocalDatasource(localManager: stub)

        // THEN
        let capturedResult = sut.removeFavoriteCharacter(id: "1")

        // WHEN
        XCTAssertFalse(capturedResult)
    }
}
