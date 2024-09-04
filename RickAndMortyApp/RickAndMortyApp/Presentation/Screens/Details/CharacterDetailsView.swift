//
//  CharacterDetailsView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import SwiftUI

struct CharacterDetailsView: View {

    @StateObject private var viewModel: CharacterDetailsViewModel

    init(viewModel: CharacterDetailsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            CharacterDetailsContainerView(viewModel: viewModel)
        }
        .task {
            await viewModel.viewDidLoad()
        }
    }
}

struct CharacterDetailsContainerView: View {
    
    @ObservedObject private var viewModel: CharacterDetailsViewModel
    
    init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            image()
            content()
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
    }

    private func image() -> some View {
        AsyncImage(url: viewModel.serieCharacter?.imageURL) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(height: 300)
        } placeholder: {
            Rectangle()
                .fill(.textLightGray.opacity(0.4))
                .frame(height: 300)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private func content() -> some View {
        VStack(alignment: .leading, spacing: 12) {

            HStack {

                Text(viewModel.serieCharacter?.name ?? "")
                    .AppFont(.Roboto(16, weight: .bold), color: .darkGray)

                Spacer()

                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .onTapGesture {
                        viewModel.updateFavoriteSerieCharacter()
                    }
            }

            VStack(alignment: .leading, spacing: 4) {
                DetailsInformationRowView(text: viewModel.serieCharacter?.status, icon: "pulse")
                DetailsInformationRowView(text: viewModel.serieCharacter?.species, icon: "alien")
                DetailsInformationRowView(text: viewModel.serieCharacter?.origin.name, icon: "planet")
            }
        }
    }
}
