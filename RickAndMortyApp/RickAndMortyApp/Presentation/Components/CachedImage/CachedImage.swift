//
//  CachedImageView.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 23/10/24.
//

import SwiftUI

struct CachedImage<Content: View>: View {

    @StateObject private var viewModel: CachedImageViewModel
    let url: URL?
    let animation: Animation?
    let transition: AnyTransition
    let content: (AsyncImagePhase) -> Content
    let id: UUID = UUID()

    @State private var retryCount = 0

    init(url: URL?,
         animation: Animation? = nil,
         transition: AnyTransition = .identity,
         @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.animation = animation
        self.transition = transition
        self.content = content
        self._viewModel = StateObject(wrappedValue: CachedImageViewModel())
    }

    var body: some View {
        ZStack {
            switch viewModel.currentState {
            case .loading:
                content(.empty)
                    .transition(transition)
            case .success(let data):
                if let image = UIImage(data: data) {
                    content(.success(Image(uiImage: image)))
                        .transition(transition)
                } else {
                    content(.failure(CachedImageError.invalidData))
                        .transition(transition)
                }
            case .failed(let error):
                content(.failure(error))
                    .transition(transition)
            default:
                content(.empty)
                    .transition(transition)
            }
        }
        .animation(animation, value: viewModel.currentState)
        .task {
            await viewModel.load(url)
        }
        .id(id)
    }
}

extension CachedImage {
    enum CachedImageError: Error {
        case invalidData
    }
}
