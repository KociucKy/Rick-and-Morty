//
//  CharactersWebService.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

final class CharactersWebService: WebService {
    let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func loadContent<T: Decodable>(endpoint: APIEndpoint) async throws -> T {
        let request = try getURLRequest(for: endpoint)
        let (data, response) = try await httpClient.perform(request: request)
        return try APIRequestMapper.decodeData(data: data, response: response)
    }
}
