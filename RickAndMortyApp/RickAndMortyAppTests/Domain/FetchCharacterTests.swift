//
//  FetchCharacterTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

class FetchCharacterTests: XCTestCase {

    func test_execute_success_when_repository_return_character() async throws {
        // GIVEN
        let expectedData = SerieCharacter.mockedData
        let stub = CharactersRepositoryStub(fetchCharacterResult: .success(expectedData))
        let sut = DefaultFetchCharacter(charactersRepository: stub)

        // WHEN
        let capturedResult = await sut.execute(id: "")

        // THEN
        let result = try XCTUnwrap(capturedResult.get())

        XCTAssertEqual(result, expectedData)
    }

    func test_execute_success_when_repository_return_generic_error() async throws {
        // GIVEN
        let stub = CharactersRepositoryStub(fetchCharacterResult: .failure(.generic))
        let sut = DefaultFetchCharacter(charactersRepository: stub)

        // WHEN
        let capturedResult = await sut.execute(id: "")

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .generic)
    }
}
