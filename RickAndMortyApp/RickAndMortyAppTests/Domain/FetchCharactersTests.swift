//
//  FetchCharactersTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

class FetchCharactersTests: XCTestCase {

    func test_execute_success_when_repository_return_character() async throws {
        // GIVEN
        let expectedData = SerieCharacter.mockedDataList
        let stub = CharactersRepositoryStub(fetchCharactersResult: .success(expectedData))
        let sut = DefaultFetchCharacters(charactersRepository: stub)

        // WHEN
        let capturedResult = await sut.execute()

        // THEN
        let result = try XCTUnwrap(capturedResult.get())

        XCTAssertEqual(result, expectedData)
    }

    func test_execute_success_when_repository_return_generic_error() async throws {
        // GIVEN
        let stub = CharactersRepositoryStub(fetchCharactersResult: .failure(.generic))
        let sut = DefaultFetchCharacters(charactersRepository: stub)

        // WHEN
        let capturedResult = await sut.execute()

        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .generic)
    }
}
