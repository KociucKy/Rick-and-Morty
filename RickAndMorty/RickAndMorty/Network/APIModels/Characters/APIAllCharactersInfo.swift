//
//  APIAllCharactersInfo.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

struct APIAllCharactersInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
