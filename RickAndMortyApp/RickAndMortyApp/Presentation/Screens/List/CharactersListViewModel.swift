//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {

    private let fetchCharacters: FetchCharacters
    private var page: Int = 1

    init(fetchCharacters: FetchCharacters) {
        self.fetchCharacters = fetchCharacters
    }

    func viewDidLoad() async {
        await fetchCharacters(page: page)
    }
}

extension CharactersListViewModel {

    func fetchCharacters(page: Int) async {
        let result = await fetchCharacters.execute(page: page)
        
        switch result {
        case .success(let characters):
            handleFetchCharactersSuccess(characters: characters)
        case .failure(let error):
            handleFetchCharactersFailure(error: error)
        }
    }

    private func handleFetchCharactersSuccess(characters: [SerieCharacter]) {
        print("||SUCCESS|| characters: \(characters.count)")
    }

    private func handleFetchCharactersFailure(error: AppError) {
        print("||ERROR|| fetchCharacters error: \(error.localizedDescription)")
    }
}
