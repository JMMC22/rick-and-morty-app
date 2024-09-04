//
//  CharactersRepositoryTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

final class CharactersRepositoryTests: XCTestCase {
    
    func test_fetchCharacters_success_when_remote_datasource_return_non_empty_array_and_favorites_datasource_return_empty_array() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub()
        let expectedResult = SerieCharactersResponseDTO.mockedData
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharactersResult: .success(expectedResult))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(result, SerieCharacter.mockedDataList)
    }

    func test_fetchCharacters_success_when_remote_datasource_return_empty_array_and_favorites_datasource_return_empty_array() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub()
        let expectedResult = SerieCharactersResponseDTO(data: SerieCharactersDataDTO(characters: SerieCharactersResultsDTO(results: [])))
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharactersResult: .success(expectedResult))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(result, [])
    }

    func test_fetchCharacters_fail_when_remote_datasource_return_error_and_favorites_datasource_return_empty_array() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub()
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharactersResult: .failure(.decode))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .generic)
    }
    
    func test_fetchCharacters_success_when_remote_datasource_return_non_empty_array_and_favorites_datasource_return_non_empty_array() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub(listResult: ["1", "42"])
        let expectedResult = SerieCharactersResponseDTO.mockedData
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharactersResult: .success(expectedResult))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // THEN
        let result = try XCTUnwrap(capturedResult.get())

        XCTAssertFalse(result[0].isFavorite)
        XCTAssertTrue(result[1].isFavorite)
    }

    func test_fetchCharacters_fail_when_remote_datasource_return_error_and_favorites_datasource_return_non_empty_array() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub(listResult: ["1", "42"])
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharactersResult: .failure(.decode))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .generic)
    }
    
    func test_fetchCharacter_success_when_remote_datasource_return_success_and_favorites_datasource_return_empty_array() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub()
        let expectedResult = SerieCharacterDetailsResponseDTO.mockedData
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharacterResult: .success(expectedResult))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacter(id: "")

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(result, SerieCharacter.mockedData)
    }
    
    func test_fetchCharacter_fail_when_remote_datasource_return_error_and_favorites_datasource_return_empty_array() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub()
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharacterResult: .failure(.decode))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacter(id: "")

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .generic)
    }

    func test_fetchCharacter_success_when_remote_datasource_return_success_and_favorites_datasource_return_non_empty_array_and_is_not_favorite() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub(listResult: ["4"])
        let expectedResult = SerieCharacterDetailsResponseDTO.mockedData
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharacterResult: .success(expectedResult))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacter(id: "")

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        XCTAssertFalse(result.isFavorite)
    }
    
    func test_fetchCharacter_success_when_remote_datasource_return_success_and_favorites_datasource_return_non_empty_array_and_is_favorite() async throws {
        // GIVEN
        let favoritesStub = FavoritesCharactersLocalDatasourceStub(listResult: ["41"])
        let expectedResult = SerieCharacterDetailsResponseDTO.mockedData
        let remoteStub = CharactersRemoteDatasourceStub(fetchCharacterResult: .success(expectedResult))
        let sut = DefaultCharactersRepository(remoteDatasource: remoteStub,
                                              favoritesDatasource: favoritesStub,
                                              errorMapper: AppErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchCharacter(id: "")

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        XCTAssertTrue(result.isFavorite)
    }
}
