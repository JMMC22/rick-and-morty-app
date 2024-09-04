//
//  AppCoordinator.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedItem: AppCoordinator.Page?
}

extension AppCoordinator {

    enum Page: Hashable, Identifiable {
        case list
        case details(id: String)
        
        var id: String {
            String(describing: self)
        }
    }

    // MARK: - Navigate
    func push(_ page: AppCoordinator.Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    // MARK: - Sheet
    func present(_ page: AppCoordinator.Page) {
        presentedItem = page
    }

    func dismissSheet() {
        self.presentedItem = nil
    }

    @ViewBuilder
    func build(page: AppCoordinator.Page) -> some View {
        switch page {
        case .list:
            DIContainer.shared.container.resolve(CharactersListView.self)
        case .details(let id):
            DIContainer.shared.container.resolve(CharacterDetailsView.self, argument: id)
        }
    }
}


