//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var appCoordinator: AppCoordinator

    private let deepLinkHandler: DeepLinkHandler

    init(deepLinkHandler: DeepLinkHandler) {
        self.deepLinkHandler = deepLinkHandler
    }

    var body: some View {
        appCoordinator.build(page: .list)
            .onOpenURL { url in handleDeepLinks(url: url) }
    }

    private func handleDeepLinks(url: URL) {
        guard let deepLink = DeepLink(url: url) else { return }
        let page = deepLinkHandler.open(deepLink: deepLink)
        appCoordinator.push(page)
    }
}
