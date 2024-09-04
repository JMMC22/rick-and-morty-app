//
//  DeepLinkHandler.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation

enum DeepLink: Equatable {
    case details(id: String)

    init?(url: URL) {
        guard let host = url.host else { return nil }

        switch host {
        case "character":
            guard let id = Int(url.pathComponents[1]) else { return nil }
            self = .details(id: String(id))
        default:
            return nil
        }
    }
}

protocol DeepLinkHandler {
    func open(deepLink: DeepLink) -> AppCoordinator.Page
}

struct DefaultDeepLinkHandler: DeepLinkHandler {

    func open(deepLink: DeepLink) -> AppCoordinator.Page {
        switch deepLink {
        case .details(let id):
            return .details(id: id)
        }
    }
}
