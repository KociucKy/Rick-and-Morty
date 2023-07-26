//
//  Characater.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import Foundation

struct Character: Identifiable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: CharacterGender
    let origin: CharacterLocation
    let location: CharacterLocation
    let image: URL?
    let episode: [String]
    let url: URL?
    let created: String

    init(
        id: Int,
        name: String,
        status: CharacterStatus,
        species: String,
        type: String,
        gender: CharacterGender,
        origin: CharacterLocation,
        location: CharacterLocation,
        image: URL?,
        episode: [String],
        url: URL?,
        created: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

extension Character {
    init(apiItem: APICharacter) {
        self.init(
            id: apiItem.id,
            name: apiItem.name,
            status: CharacterStatus(rawValue: apiItem.status) ?? .unknown,
            species: apiItem.species,
            type: apiItem.type,
            gender: CharacterGender(rawValue: apiItem.gender) ?? .unknown,
            origin: CharacterLocation(apiItem: apiItem.origin),
            location: CharacterLocation(apiItem: apiItem.location),
            image: URL(string: apiItem.image),
            episode: apiItem.episode,
            url: URL(string: apiItem.url),
            created: apiItem.created
        )
    }
}
