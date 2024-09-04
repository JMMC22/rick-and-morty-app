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
    private var nextPage: Int = 1
    private var didReachedEnd: Bool = false

    var filters: [FilterOption]

    init(fetchCharacters: FetchCharacters) {
        self.fetchCharacters = fetchCharacters
        self.filters = SerieCharacterGender.buildFilterOptions()
        self.selectedFilter = FilterOption.all
    }

    func viewDidLoad() async {
        if serieCharacters.isEmpty {
            await fetchCharacters()
        }
    }

    func loadFiltered() {
        reset()
        Task {
            await fetchCharacters()
        }
    }
    
    func loadMoreContent(currentItem item: SerieCharacter) {
        let thresholdIndex = serieCharacters.index(serieCharacters.endIndex, offsetBy: -1 )
        let thresholdItem = serieCharacters[thresholdIndex]

        if thresholdItem.id == item.id, !didReachedEnd {
            nextPage += 1
            Task { await fetchCharacters() }
        }
    }
}

extension CharactersListViewModel {

    func fetchCharacters() async {
        let gender = getGenreBySelectedFilter()

        let result = await fetchCharacters.execute(page: nextPage, gender: gender)

        switch result {
        case .success(let serieCharacters):
            handleFetchCharactersSuccess(serieCharacters: serieCharacters)
        case .failure(let error):
            handleFetchCharactersFailure(error: error)
        }
    }

    private func handleFetchCharactersSuccess(serieCharacters: [SerieCharacter]) {
        if serieCharacters.isEmpty {
            didReachedEnd = true
        }

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

extension CharactersListViewModel {

    private func reset() {
        resetPagination()
        DispatchQueue.main.async {
            self.serieCharacters = []
        }
    }

    private func resetPagination() {
        nextPage = 1
        didReachedEnd = false
    }
}
