//
//  APICharacter.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

struct APICharacter: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: APILocation
    let location: APILocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
