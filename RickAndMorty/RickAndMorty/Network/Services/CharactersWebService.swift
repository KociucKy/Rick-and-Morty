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

    func loadAllCharacters() async throws -> APIAllCharactersResponse {
        let request = try getURLRequest(for: CharactersEndpoint.getAllCharacters)
        let (data, response) = try await httpClient.perform(request: request)
        return try APIRequestMapper.decodeData(data: data, response: response)
    }

    func loadAnotherPage(_ page: Int) async throws -> APIAllCharactersResponse {
        let request = try getURLRequest(for: CharactersEndpoint.getAnotherCharactersPage(page: page))
        let (data, response) = try await httpClient.perform(request: request)
        return try APIRequestMapper.decodeData(data: data, response: response)
    }
}
