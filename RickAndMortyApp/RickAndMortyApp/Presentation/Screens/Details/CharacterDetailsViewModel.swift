//
//  CharacterDetailsViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {

    @Published var serieCharacter: SerieCharacter?
    @Published var isFavorite: Bool = false
    @Published var error: AppError?

    private let id: String
    private let fetchCharacter: FetchCharacter
    private let addFavoriteCharacter: AddFavoriteCharacter
    private let removeFavoriteCharacter: RemoveFavoriteCharacter

    init(id: String, 
         fetchCharacter: FetchCharacter,
         addFavoriteCharacter: AddFavoriteCharacter,
         removeFavoriteCharacter: RemoveFavoriteCharacter) {
        self.id = id
        self.fetchCharacter = fetchCharacter
        self.addFavoriteCharacter = addFavoriteCharacter
        self.removeFavoriteCharacter = removeFavoriteCharacter
    }

    func viewDidLoad() async {
        await fetchCharacter()
    }
}

extension CharacterDetailsViewModel {

    private func fetchCharacter() async {
        let result = await fetchCharacter.execute(id: id)

        switch result {
        case .success(let serieCharacter):
            handleFetchCharacterSuccess(serieCharacter: serieCharacter)
        case .failure(let error):
            handleFetchCharacterFailure(error: error)
        }
    }

    private func handleFetchCharacterSuccess(serieCharacter: SerieCharacter) {
        DispatchQueue.main.async {
            self.serieCharacter = serieCharacter
            self.isFavorite = serieCharacter.isFavorite
        }
    }

    private func handleFetchCharacterFailure(error: AppError) {
        DispatchQueue.main.async {
            self.error = error
        }
    }
}

extension CharacterDetailsViewModel {

    func updateFavoriteSerieCharacter() {
        if isFavorite {
            removeFavoriteSerieCharacter()
        } else {
            addFavoriteSerieCharacter()
        }
    }
    
    private func addFavoriteSerieCharacter() {
        let result = addFavoriteCharacter.execute(id: id)

        if result {
            updateFavoriteUI(isFavorite: true)
        }
    }

    private func removeFavoriteSerieCharacter() {
        let result = removeFavoriteCharacter.execute(id: id)

        if result {
            updateFavoriteUI(isFavorite: false)
        }
    }

    private func updateFavoriteUI(isFavorite: Bool) {
        DispatchQueue.main.async {
            self.isFavorite = isFavorite
        }
    }
}
