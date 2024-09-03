//
//  Endpoint.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 3/9/24.
//

import Foundation

public enum HTTPMethodType: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethodType { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParameters: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
}
