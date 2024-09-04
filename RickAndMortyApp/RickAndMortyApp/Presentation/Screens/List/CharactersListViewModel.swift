//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {

    @Published var serieCharacters: [SerieCharacter] = []

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
        let result = await fetchCharacters.execute(page: page, gender: nil)
        
        switch result {
        case .success(let serieCharacters):
            handleFetchCharactersSuccess(serieCharacters: serieCharacters)
        case .failure(let error):
            handleFetchCharactersFailure(error: error)
        }
    }

    private func handleFetchCharactersSuccess(serieCharacters: [SerieCharacter]) {
        print("||SUCCESS|| characters: \(serieCharacters.count)")
        
        DispatchQueue.main.async {
            self.serieCharacters = serieCharacters
        }
    }

    private func handleFetchCharactersFailure(error: AppError) {
        print("||ERROR|| fetchCharacters error: \(error.localizedDescription)")
    }
}
