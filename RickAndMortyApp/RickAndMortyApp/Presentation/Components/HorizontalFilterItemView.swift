//
//  HorizontalFilterItemView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import SwiftUI

struct HorizontalFilterItemView: View {

    private let item: FilterOption
    private let isSelected: Bool
    private let action: () -> Void

    init(item: FilterOption, isSelected: Bool, action: @escaping () -> Void) {
        self.item = item
        self.isSelected = isSelected
        self.action = action
    }

    private var textWeight: FontWeight {
        isSelected ? .bold : .regular
    }

    private var backgroundColor: Color {
        isSelected ? Color.textLightGray.opacity(0.4) : Color.white
    }

    private var backgroundShape: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(backgroundColor)
            .strokeBorder(Color.textDarkGray, lineWidth: 1)
    }

    var body: some View {
        Text(item.value)
            .AppFont(.Roboto(14, weight: textWeight), color: .textDarkGray)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(backgroundShape)
            .onTapGesture { action() }
    }
}
