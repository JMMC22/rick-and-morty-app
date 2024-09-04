//
//  HorizontalFilterView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import SwiftUI

struct HorizontalFilterView: View {

    private let filters: [FilterOption]
    @Binding private var selectedFilter: FilterOption

    init(filters: [FilterOption], selectedFilter: Binding<FilterOption>) {
        self.filters = filters
        self._selectedFilter = selectedFilter
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.key) { filter in
                    HorizontalFilterItemView(item: filter, isSelected: filter.key == selectedFilter.key) {
                        selectedFilter = filter
                    }
                }
            }
        }
    }
}
