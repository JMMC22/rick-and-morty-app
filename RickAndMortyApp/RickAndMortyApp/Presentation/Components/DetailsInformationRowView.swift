//
//  DetailsInformationRowView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import SwiftUI

struct DetailsInformationRowView: View {

    private let text: String?
    private let icon: String

    init(text: String?, icon: String) {
        self.text = text
        self.icon = icon
    }

    var body: some View {
        HStack(spacing: 8) {

            Image(icon)
                .resizable()
                .frame(width: 24, height: 24)

            Text(text ?? "")
        }
        .AppFont(.Roboto(16, weight: .bold), color: .textDarkGray)
    }
}
