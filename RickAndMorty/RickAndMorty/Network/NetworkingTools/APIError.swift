//
//  APIError.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidHTTPResponse
}
