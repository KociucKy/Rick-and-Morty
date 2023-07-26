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
    let episode: [URL?]
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
        episode: [URL?],
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

    static var mockCharacter: Character {
        return Character(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "",
            gender: .male,
            origin: CharacterLocation(name: "Earth", url: URL(string: "https://rickandmortyapi.com/api/location/1")),
            location: CharacterLocation(name: "Earth", url: URL(string: "https://rickandmortyapi.com/api/location/1")),
            image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
            episode: [
                URL(string: "https://rickandmortyapi.com/api/episode/1"),
                URL(string: "https://rickandmortyapi.com/api/episode/2")
            ],
            url: URL(string: "https://rickandmortyapi.com/api/character/1"),
            created: "2017-11-04T18:48:46.250Z"
        )
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
            episode: apiItem.episode.map { URL(string: $0) },
            url: URL(string: apiItem.url),
            created: apiItem.created
        )
    }
}
