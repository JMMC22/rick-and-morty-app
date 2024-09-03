//
//  UserDefaultsError.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

enum UserDefaultsError: Error {
    case keyNotFound
    case decodingFailed
    case encodingFailed
    case invalidData
    case unknown
}

extension UserDefaultsError {

    var localizedDescription: String {
        switch self {
        case .keyNotFound:
            return "The specified key was not found in UserDefaults."
        case .decodingFailed:
            return "Failed to decode the data from UserDefaults."
        case .encodingFailed:
            return "Failed to encode the data for UserDefaults."
        case .invalidData:
            return "The data retrieved from UserDefaults is invalid."
        case .unknown:
            return "An unknown error occurred with UserDefaults."
        }
    }
}
