//
//  ViewsAssembly.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import Swinject

final class ViewsAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Content View
        container.register(ContentView.self) { resolver in
            guard let deepLinkHanlder = resolver.resolve(DeepLinkHandler.self) else {
                fatalError("DeepLinkHandler dependency could not be resolved")
            }

            return ContentView(deepLinkHandler: deepLinkHanlder)
        }

        // MARK: List View
        container.register(CharactersListView.self) { resolver in
            guard let viewModel = resolver.resolve(CharactersListViewModel.self) else {
                fatalError("CharactersListViewModel dependency could not be resolved")
            }

            return CharactersListView(viewModel: viewModel)
        }

        // MARK: Details View
        container.register(CharacterDetailsView.self) { (resolver, id: String) in
            guard let viewModel = resolver.resolve(CharacterDetailsViewModel.self, argument: id) else {
                fatalError("CharacterDetailsViewModel dependency could not be resolved")
            }

            return CharacterDetailsView(viewModel: viewModel)
        }
    }
}
