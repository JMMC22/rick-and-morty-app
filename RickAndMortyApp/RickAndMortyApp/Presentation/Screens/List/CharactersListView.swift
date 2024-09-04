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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                await viewModel.viewDidLoad()
            }
    }
}
