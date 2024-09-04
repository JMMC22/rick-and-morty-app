//
//  DatasourcesAssembly.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import Swinject

final class DatasourcesAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Characters Datasource
        container.register(CharactersRemoteDatasource.self) { _ in
            return DefaultCharactersRemoteDatasource(httpClient: NetworkManager())
        }

        // MARK: Favorites Datasources
        container.register(FavoritesCharactersLocalDatasource.self) { _ in
            return DefaultFavoritesCharactersLocalDatasource(localManager: DefaultUserDefaultsManager.shared)
        }
    }
}
