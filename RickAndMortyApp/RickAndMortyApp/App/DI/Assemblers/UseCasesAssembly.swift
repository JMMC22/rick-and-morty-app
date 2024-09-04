//
//  UseCasesAssembly.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import Swinject

final class UseCasesAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Fetch Characters
        container.register(FetchCharacters.self) { resolver in
            guard let charactersRepository = resolver.resolve(CharactersRepository.self) else {
                fatalError("CharactersRepository dependency could not be resolved")
            }
            
            return DefaultFetchCharacters(charactersRepository: charactersRepository)
        }
    }
}
