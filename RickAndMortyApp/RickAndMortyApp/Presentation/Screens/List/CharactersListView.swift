//
//  CharactersListView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import SwiftUI

struct CharactersListView: View {

    @EnvironmentObject private var appCoordinator: AppCoordinator

    @StateObject private var viewModel: CharactersListViewModel

    init(viewModel: CharactersListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            CharactersListContainerView(viewModel: viewModel) { page in
                appCoordinator.push(page)
            }
        }
        .task {
            await viewModel.viewDidLoad()
        }
        .onChange(of: viewModel.selectedFilter) {
            viewModel.loadFiltered()
        }
    }
}

struct CharactersListContainerView: View {

    @ObservedObject private var viewModel: CharactersListViewModel
    private let navigate: (AppCoordinator.Page) -> Void

    init(viewModel: CharactersListViewModel, navigate: @escaping (AppCoordinator.Page) -> Void) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self.navigate = navigate
    }

    var body: some View {
        VStack(spacing: 16) {

            HorizontalFilterView(filters: viewModel.filters, selectedFilter: $viewModel.selectedFilter)

            LazyVStack(spacing: 8) {
                ForEach(viewModel.serieCharacters) { serieCharacter in
                    row(character: serieCharacter)
                }
            }
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
    }

    private func row(character: SerieCharacter) -> some View {
        Group {
            CharactersListRowView(serieCharacter: character)
                .contentShape(Rectangle())
                .onAppear { viewModel.loadMoreContent(currentItem: character) }
                .onTapGesture { navigate(.details(id: character.id)) }
            
            if character.id != viewModel.serieCharacters.last?.id {
                Divider()
            }
        }
    }
}
