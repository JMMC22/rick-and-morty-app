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
        LazyVStack(spacing: 16) {
            ForEach(viewModel.serieCharacters) { serieCharacter in
                CharactersListRowView(serieCharacter: serieCharacter)
            }
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
    }
}
