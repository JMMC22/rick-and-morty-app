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
                .frame(width: 16, height: 16)

            Text(text ?? "")
        }
        .AppFont(.Roboto(16, weight: .regular), color: .textDarkGray)
    }
}
