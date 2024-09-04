//
//  CharactersListRowView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import SwiftUI

struct CharactersListRowView: View {

    private let serieCharacter: SerieCharacter

    init(serieCharacter: SerieCharacter) {
        self.serieCharacter = serieCharacter
    }

    var body: some View {
        HStack(spacing: 8) {
            image()
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func image() -> some View {
        AsyncImage(url: serieCharacter.imageURL) { image in
            image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }

    private func content() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(serieCharacter.name)
                .AppFont(.Roboto(12, weight: .bold), color: .darkGray)

            HStack(spacing: 4) {

                Text(serieCharacter.origin.name)

                Divider().frame(height: 12)

                Text(serieCharacter.gender.rawValue)

                if serieCharacter.isFavorite {
                    Divider().frame(height: 12)
                    Image(systemName: "heart.fill")
                }
            }
            .AppFont(.Roboto(12, weight: .light), color: .lightGray)
        }
    }
}
