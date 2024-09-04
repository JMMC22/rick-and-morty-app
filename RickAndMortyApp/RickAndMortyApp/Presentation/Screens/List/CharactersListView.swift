//
//  CharactersListView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import SwiftUI

struct CharactersListView: View {

    @StateObject private var viewModel: CharactersListViewModel

    init(viewModel: CharactersListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            CharactersListContainerView(viewModel: viewModel)
        }
        .task {
            await viewModel.viewDidLoad()
        }
    }
}

struct CharactersListContainerView: View {

    @ObservedObject private var viewModel: CharactersListViewModel

    init(viewModel: CharactersListViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }

    var body: some View {
        LazyVStack {
            ForEach(viewModel.serieCharacters) { serieCharacter in
                Text(serieCharacter.name)
            }
        }
    }
}
