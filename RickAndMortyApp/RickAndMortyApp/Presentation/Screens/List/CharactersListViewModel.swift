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
    @Published var isLoading: Bool = false
    @Published var error: AppError?

    private let fetchCharacters: FetchCharacters
    private let getFavoritesCharactersIds: GetFavoritesCharactersIds

    private var nextPage: Int = 1
    private var didReachedEnd: Bool = false

    let filters: [FilterOption]

    init(fetchCharacters: FetchCharacters,
         getFavoritesCharactersIds: GetFavoritesCharactersIds) {
        self.fetchCharacters = fetchCharacters
        self.getFavoritesCharactersIds = getFavoritesCharactersIds
        self.filters = CharactersListFilter.buildFilters()
        self.selectedFilter = filters.first ?? FilterOption.all
    }

    func viewDidLoad() async {
        if serieCharacters.isEmpty {
            isLoading(true)
            await fetchCharacters()
        } else {
            refreshCharacters()
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

        processCharacters(serieCharacters)
    }

    private func handleFetchCharactersFailure(error: AppError) {
        DispatchQueue.main.async {
            self.error = error
            self.isLoading(false)
        }
    }
}

// MARK: - Processing Characters
extension CharactersListViewModel {

    private func processCharacters(_ characters: [SerieCharacter]) {
        let mappedCharacters = mapCharacters(characters)

        DispatchQueue.main.async {
            self.serieCharacters.append(contentsOf: mappedCharacters)
            self.isLoading(false)
        }
    }

    private func refreshCharacters() {
        let mappedCharacters = mapCharacters(serieCharacters)
        DispatchQueue.main.async {
            self.serieCharacters = mappedCharacters
        }
    }

    private func mapCharacters(_ serieCharacters: [SerieCharacter]) -> [SerieCharacter] {
        let favoriteIds = getFavoriteIds()

        let mappedCharacters = serieCharacters.map { character in
            var updatedCharacter = character
            updatedCharacter.isFavorite = favoriteIds.contains(updatedCharacter.id)
            return updatedCharacter
        }

        return mappedCharacters
    }

    private func getFavoriteIds() -> [String] {
        return getFavoritesCharactersIds.execute()
    }
}

// MARK: - Filters
extension CharactersListViewModel {
    private func getGenreBySelectedFilter() -> SerieCharacterGender? {
        let filterKey = isAllFilterSelected() ? "" : selectedFilter.key
        return SerieCharacterGender(rawValue: filterKey)
    }

    private func isAllFilterSelected() -> Bool {
        return selectedFilter.key == CharactersListFilter.all.key
    }
}

// MARK: - Reset Pagination
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

// MARK: - Loading
extension CharactersListViewModel {
    private func isLoading(_ value: Bool) {
        DispatchQueue.main.async {
            self.isLoading = value
        }
    }
}
