//
//  WebService.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

protocol WebService {
    var httpClient: HTTPClient { get }
    func getURLRequest(for endpoint: APIEndpoint) throws -> URLRequest
    func loadContent<T: Decodable>(endpoint: APIEndpoint) async throws -> T
}

extension WebService {
    func getURLRequest(for endpoint: APIEndpoint) throws -> URLRequest {
        guard let url = endpoint.buildURL() else {
            throw URLError(.badURL)
        }
        return URLRequest(url: url)
    }
}
