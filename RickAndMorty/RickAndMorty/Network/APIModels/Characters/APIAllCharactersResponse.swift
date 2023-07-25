//
//  APIAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

struct APIAllCharactersResponse: Decodable {
    let info: [APIAllCharactersInfo]
    let results: [APICharacter]
}
