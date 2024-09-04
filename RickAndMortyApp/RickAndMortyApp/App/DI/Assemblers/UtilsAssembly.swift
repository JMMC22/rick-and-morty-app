//
//  UtilsAssembly.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import Swinject

final class UtilsAssembly: Assembly {

    func assemble(container: Container) {
        // MARK: DeepLink Handler
        container.register(DeepLinkHandler.self) { resolver in
            return DefaultDeepLinkHandler()
        }
    }
}
