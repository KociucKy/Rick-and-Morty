//
//  CharactersEndpoint.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

enum CharactersEndpoint {
    case getAllCharacters
    case getSingleCharacter(id: Int)
}

extension CharactersEndpoint: APIEndpoint {
    var scheme: HTTPScheme {
        return .https
    }

    var baseURL: String {
        return "rickandmortyapi.com/api"
    }

    var path: String {
        return "/character"
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getAllCharacters:
            return []
        case .getSingleCharacter(let id):
            return [URLQueryItem(name: "id", value: "\(id)")]
        }
    }

    var method: HTTPMethod {
        return .get
    }
}
