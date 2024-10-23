//
//  CachedImageViewModel.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 23/10/24.
//

import Foundation

@MainActor
final class CachedImageViewModel: ObservableObject {

    @Published private(set) var currentState: CurrentState?

    private let imageRetriver = ImageRetriver()

    @MainActor
    func load(_ url: URL?, cache: ImageCache = .shared) async {
        guard let imgUrl = url?.absoluteString else { return }
        self.currentState = .loading

        if let imageData = cache.object(forkey: imgUrl as NSString) {
            self.currentState = .success(data: imageData)
            return
        }

        do {
            let data = try await imageRetriver.fetch(imgUrl)
            DispatchQueue.main.async {
                self.currentState = .success(data: data)
            }
            cache.set(object: data as NSData,
                      forKey: imgUrl as NSString)
        } catch {
            self.currentState = .failed(error: error)
        }
    }
}

extension CachedImageViewModel {
    enum CurrentState {
        case loading
        case failed(error: Error)
        case success(data: Data)
    }
}

extension CachedImageViewModel.CurrentState: Equatable {
    static func == (lhs: CachedImageViewModel.CurrentState,
                    rhs: CachedImageViewModel.CurrentState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (let .failed(lhsError), let .failed(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (let .success(lhsData), let .success(rhsData)):
            return lhsData == rhsData
        default:
            return false
        }
    }
}
