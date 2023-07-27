//
//  CharactersEndpoint.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

enum CharactersEndpoint {
    case getAllCharacters
    case getAnotherCharactersPage(page: Int)
}

extension CharactersEndpoint: APIEndpoint {
    var scheme: HTTPScheme {
        return .https
    }

    var baseURL: String {
        return "rickandmortyapi.com"
    }

    var path: String {
        return "/api/character/"
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getAllCharacters:
            return []
        case .getAnotherCharactersPage(let page):
            return [URLQueryItem(name: "page", value: "\(page)")]
        }
    }

    var method: HTTPMethod {
        return .get
    }
}

// https://rickandmortyapi.com/api/character?page=2
// https://rickandmortyapi.com/api/character/?page=2
// https://rickandmortyapi.com/api/character/?page=2
