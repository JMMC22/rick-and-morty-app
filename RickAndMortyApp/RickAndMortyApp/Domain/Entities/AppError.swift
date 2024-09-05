//
//  AppError.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

enum AppError: Error {
    case generic
    case unknown
}

extension AppError {
    var localized: String {
        switch self {
        case .generic:
            return String(localized: "error.generic")
        case .unknown:
            return String(localized:  "error.unknown")
        }
    }
}
