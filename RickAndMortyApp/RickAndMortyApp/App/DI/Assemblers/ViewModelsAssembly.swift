//
//  ViewModelsAssembly.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import Swinject

final class ViewModelsAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: List VM
        container.register(CharactersListViewModel.self) { resolver in
            guard let fetchCharacters = resolver.resolve(FetchCharacters.self) else {
                fatalError("FetchCharacters dependency could not be resolved")
            }

            return CharactersListViewModel(fetchCharacters: fetchCharacters)
        }
    }
}
