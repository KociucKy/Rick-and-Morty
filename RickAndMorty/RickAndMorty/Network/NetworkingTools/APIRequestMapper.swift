//
//  APIMapper.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

struct APIRequestMapper {
    static func map<T>(data: Data, response: HTTPURLResponse) throws -> T where T: Decodable {
        if (200..<300) ~= response.statusCode {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            throw APIError.invalidHTTPResponse
        }
    }
}
