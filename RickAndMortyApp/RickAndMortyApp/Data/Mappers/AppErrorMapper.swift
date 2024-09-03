//
//  AppErrorMapper.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

class AppErrorMapper {

    func map(error: Error) -> AppError {
        switch error {
        case let requestError as RequestError:
            return .generic
        default:
            return .unknown
        }
    }
}
