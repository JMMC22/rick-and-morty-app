//
//  DIContainer.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import Swinject

final class DIContainer {

    static let shared = DIContainer()

    let container: Container = Container()
    let assembler: Assembler

    init() {
        assembler = Assembler([
            DatasourcesAssembly(),
            RepositoriesAssembly(),
            UseCasesAssembly(),
            ViewModelsAssembly(),
            ViewsAssembly()
        ], container: container)
    }
}
