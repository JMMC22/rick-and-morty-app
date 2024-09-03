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
        case _ as RequestError:
            return .generic
        case _ as UserDefaultsError:
            return .generic
        default:
            return .unknown
        }
    }
}
