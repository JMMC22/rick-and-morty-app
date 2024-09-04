//
//  CharactersListViewModelTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

class CharactersListViewModelTests: XCTestCase {

    func test_viewDidLoad_updates_characters_success_when_fetch_characters_success() async {
        // GIVEN
        let expectedCharacters = SerieCharacter.mockedDataList
        let fetchCharactersStub = FetchCharactersStub(result: .success(expectedCharacters))
        let getFavoritesStub = GetFavoritesCharactersIdsStub(result: [])
        let sut = CharactersListViewModel(fetchCharacters: fetchCharactersStub, getFavoritesCharactersIds: getFavoritesStub)

        let expectation = XCTestExpectation(description: "Wait for UI update")

        let cancellable = sut.$serieCharacters.sink { characters in
            if !characters.isEmpty {
                expectation.fulfill()
            }
        }

        // WHEN
        await sut.viewDidLoad()

        // THEN
        await fulfillment(of: [expectation], timeout: 1.0)

        XCTAssertEqual(sut.serieCharacters, expectedCharacters)
        
        cancellable.cancel()
    }

    func test_viewDidLoad_updates_characters_success_when_fetch_characters_fail() async {
        // GIVEN
        let fetchCharactersStub = FetchCharactersStub(result: .failure(.generic))
        let getFavoritesStub = GetFavoritesCharactersIdsStub(result: [])
        let sut = CharactersListViewModel(fetchCharacters: fetchCharactersStub, getFavoritesCharactersIds: getFavoritesStub)

        let expectation = XCTestExpectation(description: "Wait for UI update")

        let cancellable = sut.$serieCharacters.sink { characters in
            expectation.fulfill()
        }

        // WHEN
        await sut.viewDidLoad()

        // THEN
        await fulfillment(of: [expectation], timeout: 1.0)

        XCTAssertEqual(sut.serieCharacters, [])
        
        cancellable.cancel()
    }

    func test_viewDidLoad_updates_characters_success_when_fetch_characters_success_and_map_to_favorite() async {
        // GIVEN
        let expectedCharacters = SerieCharacter.mockedDataList
        let fetchCharactersStub = FetchCharactersStub(result: .success(expectedCharacters))
        let getFavoritesStub = GetFavoritesCharactersIdsStub(result: ["42"])
        let sut = CharactersListViewModel(fetchCharacters: fetchCharactersStub, getFavoritesCharactersIds: getFavoritesStub)

        let expectation = XCTestExpectation(description: "Wait for UI update")

        let cancellable = sut.$serieCharacters.sink { characters in
            if !characters.isEmpty {
                expectation.fulfill()
            }
        }

        // WHEN
        await sut.viewDidLoad()

        // THEN
        await fulfillment(of: [expectation], timeout: 1.0)

        XCTAssertEqual(sut.serieCharacters, expectedCharacters)
        XCTAssertTrue(sut.serieCharacters[1].isFavorite)
        
        cancellable.cancel()
    }
}
