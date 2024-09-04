//
//  CharacterDetailsViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {

    @Published var serieCharacter: SerieCharacter?

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
        print("||SUCCESS|| character: \(serieCharacter.id)")

        DispatchQueue.main.async {
            self.serieCharacter = serieCharacter
        }
    }

    private func handleFetchCharacterFailure(error: AppError) {
        print("||ERROR|| fetchCharacter error: \(error.localizedDescription)")
    }
}
