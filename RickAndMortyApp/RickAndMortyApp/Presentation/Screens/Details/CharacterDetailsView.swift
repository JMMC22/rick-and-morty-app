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
        .errorAlert(error: $viewModel.error)
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
        CachedImage(url: viewModel.serieCharacter?.imageURL) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
            default:
                Rectangle()
                    .fill(.textLightGray.opacity(0.2))
                    .frame(height: 300)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.textLightGray.opacity(0.4), lineWidth: 2)
        )
    }

    private func content() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            header()
            information()
        }
    }

    private func header() -> some View {
        HStack {

            Text(viewModel.serieCharacter?.name ?? "")
                .AppFont(.Roboto(24, weight: .bold), color: .textDarkGray)

            Spacer()

            Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                .resizable()
                .foregroundStyle(Color.mutantPink)
                .frame(width: 24, height: 24)
                .onTapGesture {
                    viewModel.updateFavoriteSerieCharacter()
                }
        }
    }

    private func information() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            DetailsInformationRowView(text: viewModel.serieCharacter?.status, icon: "pulse")
            DetailsInformationRowView(text: viewModel.serieCharacter?.species, icon: "alien")
            DetailsInformationRowView(text: viewModel.serieCharacter?.origin.name, icon: "planet")
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.textLightGray.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.textLightGray.opacity(0.4), lineWidth: 2)
        )
    }
}
