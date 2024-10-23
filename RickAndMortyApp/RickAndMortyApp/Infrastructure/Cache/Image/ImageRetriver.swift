//
//  ImageRetriver.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 23/10/24.
//

import SwiftUI

struct ImageRetriver {

    func fetch(_ imgUrl: String) async throws -> Data {
        guard let url = URL(string: imgUrl) else {
            throw RetriverError.invalidUrl
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

private extension ImageRetriver {
    enum RetriverError: Error {
        case invalidUrl
    }
}
