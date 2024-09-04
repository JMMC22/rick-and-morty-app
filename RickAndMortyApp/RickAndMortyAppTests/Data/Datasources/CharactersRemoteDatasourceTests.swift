//
//  CharactersRemoteDatasourceTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

final class CharactersRemoteDatasourceTests: XCTestCase {

    func test_fetchCharacters_success_when_httpclient_success_and_response_is_correct() async throws {
        // GIVEN
        let data = """
        {
          "data": {
            "characters": {
              "results": [
                {
                  "id": "41",
                  "name": "Big Boobed Waitress",
                  "status": "Alive",
                  "species": "Mythological Creature",
                  "gender": "Female",
                  "origin": {
                    "name": "Fantasy World"
                  },
                  "image": "www.image.com"
                },
                {
                  "id": "42",
                  "name": "Big Head Morty",
                  "status": "unknown",
                  "species": "Human",
                  "gender": "Male",
                  "origin": {
                    "name": "unknown"
                  },
                  "image": "www.image.com"
                }]
                }
            }
        }
        """.data(using: .utf8)

        let expectedResult = SerieCharactersResponseDTO.mockedData
        let stub = HTTPCLientStub(result: .success(data!))
        let sut = DefaultCharactersRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(result, expectedResult)
    }

    func test_fetchCharacters_fail_when_httpclient_fail() async throws {
        let stub = HTTPCLientStub(result: .failure(.unauthorized))
        let sut = DefaultCharactersRemoteDatasource(httpClient: stub)

        // THEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // WHEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .unauthorized)
    }

    func test_fetchCharacters_faile_when_httpclient_success_and_response_is_incorrect() async throws {
        // GIVEN
        let data = """
        {
          "data": {
            "seriesCharacters": { }
            }
        }
        """.data(using: .utf8)

        let stub = HTTPCLientStub(result: .success(data!))
        let sut = DefaultCharactersRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchCharacters(page: 1, gender: nil)

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .decode)
    }

    func test_fetchCharacter_success_when_httpclient_success_and_response_is_correct() async throws {
        // GIVEN
        let data = """
        {
          "data": {
            "character": {
                  "id": "41",
                  "name": "Big Boobed Waitress",
                  "status": "Alive",
                  "species": "Mythological Creature",
                  "gender": "Female",
                  "origin": {
                    "name": "Fantasy World"
                  },
                  "image": "www.image.com"
                }
            }
        }
        """.data(using: .utf8)

        let expectedResult = SerieCharacterDetailsResponseDTO.mockedData
        let stub = HTTPCLientStub(result: .success(data!))
        let sut = DefaultCharactersRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchCharacter(id: "")

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(result, expectedResult)
    }

    func test_fetchCharacter_fail_when_httpclient_fail() async throws {
        let stub = HTTPCLientStub(result: .failure(.unauthorized))
        let sut = DefaultCharactersRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchCharacter(id: "")

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .unauthorized)
    }

    func test_fetchCharacter_faile_when_httpclient_success_and_response_is_incorrect() async throws {
        // GIVEN
        let data = """
        {
          "data": {
            "seriesCharacters": { }
            }
        }
        """.data(using: .utf8)

        let stub = HTTPCLientStub(result: .success(data!))
        let sut = DefaultCharactersRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchCharacter(id: "")

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .decode)
    }
}
