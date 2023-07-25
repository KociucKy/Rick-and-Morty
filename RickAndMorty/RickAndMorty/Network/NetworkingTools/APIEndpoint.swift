//
//  APIEndpoint.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

protocol APIEndpoint {
    var scheme: HTTPScheme { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: HTTPMethod { get }
    func buildURL() -> URLComponents
}

extension APIEndpoint {
    func buildURL() -> URLComponents {
        var components = URLComponents()
        components.scheme = self.scheme.rawValue
        components.host = self.baseURL
        components.path = self.path
        components.queryItems = self.parameters
        return components
    }
}
