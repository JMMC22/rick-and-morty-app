//
//  RepositoriesAssembly.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import Swinject

final class RepositoriesAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Characters Repository
        container.register(CharactersRepository.self) { resolver in
            guard let remoteDatasource = resolver.resolve(CharactersRemoteDatasource.self) else {
                fatalError("CharactersRemoteDatasource dependency could not be resolved")
            }

            guard let favoritesDatasource = resolver.resolve(FavoritesCharactersLocalDatasource.self) else {
                fatalError("FavoritesCharactersLocalDatasource dependency could not be resolved")
            }

            return DefaultCharactersRepository(remoteDatasource: remoteDatasource,
                                               favoritesDatasource: favoritesDatasource,
                                               errorMapper: AppErrorMapper())
        }

        // MARK: Favorites Repository
        container.register(FavoritesCharactersRepository.self) { resolver in

            guard let favoritesDatasource = resolver.resolve(FavoritesCharactersLocalDatasource.self) else {
                fatalError("FavoritesCharactersLocalDatasource dependency could not be resolved")
            }

            return DefaultFavoritesCharactersRepository(localDatasource: favoritesDatasource)
        }
    }
}
