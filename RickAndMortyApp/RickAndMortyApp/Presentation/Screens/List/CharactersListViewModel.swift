//
//  CharactersListViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {

    @Published var serieCharacters: [SerieCharacter] = []
    @Published var selectedFilter: FilterOption

    private let fetchCharacters: FetchCharacters
    private var page: Int = 1

    var filters: [FilterOption]

    init(fetchCharacters: FetchCharacters) {
        self.fetchCharacters = fetchCharacters
        self.filters = SerieCharacterGender.buildFilterOptions()
        self.selectedFilter = FilterOption.all
    }

    func viewDidLoad() async {
        await fetchCharacters(page: page)
    }
}

extension CharactersListViewModel {

    func fetchCharacters(page: Int) async {
        let gender = getGenreBySelectedFilter()

        let result = await fetchCharacters.execute(page: page, gender: gender)

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

    private func getGenreBySelectedFilter() -> SerieCharacterGender? {
        let filterKey = isAllFilterSelected() ? "" : selectedFilter.key
        return SerieCharacterGender(rawValue: filterKey)
    }

    private func isAllFilterSelected() -> Bool {
        return selectedFilter.key == FilterOption.all.key
    }
}
