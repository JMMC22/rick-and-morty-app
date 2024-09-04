//
//  CharacterDetailsViewModelTests.swift
//  RickAndMortyAppTests
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import XCTest
@testable import RickAndMortyApp

class CharacterDetailsViewModelTests: XCTestCase {

    func test_viewDidLoad_updates_character_and_is_favorite_success_when_fetch_character_success() async {
        // GIVEN
        let expectedCharacter = SerieCharacter.mockedData
        let fetchCharacterStub = FetchCharacterStub(result: .success(expectedCharacter))
        let addFavoriteStub = AddFavoriteCharacterStub(result: false)
        let removeFavoriteSub = RemoveFavoriteCharacterStub(result: false)
        let sut = CharacterDetailsViewModel(id: "",
                                            fetchCharacter: fetchCharacterStub,
                                            addFavoriteCharacter: addFavoriteStub,
                                            removeFavoriteCharacter: removeFavoriteSub)
        
        let expectation = XCTestExpectation(description: "Wait for UI update")
        
        let cancellable = sut.$serieCharacter.sink { serieCharacter in
            expectation.fulfill()
        }
        
        // WHEN
        await sut.viewDidLoad()
        
        // THEN
        await fulfillment(of: [expectation], timeout: 1.0)

        XCTAssertEqual(sut.serieCharacter, expectedCharacter)
        XCTAssertEqual(sut.isFavorite, expectedCharacter.isFavorite)
        
        cancellable.cancel()
    }

    func test_viewDidLoad_when_fetch_character_fail() async {
        // GIVEN
        let fetchCharacterStub = FetchCharacterStub(result: .failure(.generic))
        let addFavoriteStub = AddFavoriteCharacterStub(result: false)
        let removeFavoriteSub = RemoveFavoriteCharacterStub(result: false)
        let sut = CharacterDetailsViewModel(id: "",
                                            fetchCharacter: fetchCharacterStub,
                                            addFavoriteCharacter: addFavoriteStub,
                                            removeFavoriteCharacter: removeFavoriteSub)

        // WHEN
        await sut.viewDidLoad()

        // THEN
        XCTAssertNil(sut.serieCharacter)

    }

    func test_updateFavoriteCharacter_when_is_not_favorite_and_add_favorite_returns_true() async {
        // GIVEN
        let fetchCharacterStub = FetchCharacterStub(result: .failure(.unknown))
        let addFavoriteStub = AddFavoriteCharacterStub(result: true)
        let removeFavoriteSub = RemoveFavoriteCharacterStub(result: false)
        let sut = CharacterDetailsViewModel(id: "",
                                            fetchCharacter: fetchCharacterStub,
                                            addFavoriteCharacter: addFavoriteStub,
                                            removeFavoriteCharacter: removeFavoriteSub)
        
        let expectation = XCTestExpectation(description: "Wait for UI update")
        
        let cancellable = sut.$isFavorite.sink { isFavorite in
            if isFavorite {
                expectation.fulfill()
            }
        }
        
        // WHEN
        sut.updateFavoriteSerieCharacter()
        
        // THEN
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertTrue(sut.isFavorite)
        
        cancellable.cancel()
    }
    
    func test_updateFavoriteCharacter_when_is_not_favorite_and_add_favorite_returns_false() {
        // GIVEN
        let fetchCharacterStub = FetchCharacterStub(result: .failure(.unknown))
        let addFavoriteStub = AddFavoriteCharacterStub(result: false)
        let removeFavoriteSub = RemoveFavoriteCharacterStub(result: false)
        let sut = CharacterDetailsViewModel(id: "",
                                            fetchCharacter: fetchCharacterStub,
                                            addFavoriteCharacter: addFavoriteStub,
                                            removeFavoriteCharacter: removeFavoriteSub)
        
        // WHEN
        sut.updateFavoriteSerieCharacter()
        
        // THEN
        XCTAssertFalse(sut.isFavorite)
    }
    
    func test_updateFavoriteCharacter_when_is_favorite_and_remove_favorite_returns_true() async {
        // GIVEN
        let fetchCharacterStub = FetchCharacterStub(result: .failure(.unknown))
        let addFavoriteStub = AddFavoriteCharacterStub(result: false)
        let removeFavoriteSub = RemoveFavoriteCharacterStub(result: true)
        let sut = CharacterDetailsViewModel(id: "",
                                            fetchCharacter: fetchCharacterStub,
                                            addFavoriteCharacter: addFavoriteStub,
                                            removeFavoriteCharacter: removeFavoriteSub)
        sut.isFavorite = true
        
        let expectation = XCTestExpectation(description: "Wait for UI update")
        
        let cancellable = sut.$isFavorite.sink { isFavorite in
            if !isFavorite {
                expectation.fulfill()
            }
        }
        
        // WHEN
        sut.updateFavoriteSerieCharacter()
        
        // THEN
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertFalse(sut.isFavorite)
        
        cancellable.cancel()
    }
    
    func test_updateFavoriteCharacter_when_is_favorite_and_remove_favorite_returns_false() async {
        // GIVEN
        let fetchCharacterStub = FetchCharacterStub(result: .failure(.unknown))
        let addFavoriteStub = AddFavoriteCharacterStub(result: false)
        let removeFavoriteSub = RemoveFavoriteCharacterStub(result: false)
        let sut = CharacterDetailsViewModel(id: "",
                                            fetchCharacter: fetchCharacterStub,
                                            addFavoriteCharacter: addFavoriteStub,
                                            removeFavoriteCharacter: removeFavoriteSub)
        sut.isFavorite = true
        
        let expectation = XCTestExpectation(description: "Wait for UI update")
        
        let cancellable = sut.$isFavorite.sink { isFavorite in
            expectation.fulfill()
        }
        
        // WHEN
        sut.updateFavoriteSerieCharacter()
        
        // THEN
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertTrue(sut.isFavorite)
        
        cancellable.cancel()
    }
}
