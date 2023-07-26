//
//  CharactersLocation.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import Foundation

struct CharacterLocation {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

extension CharacterLocation {
    init(apiItem: APILocation) {
        self.init(name: apiItem.name, url: apiItem.url)
    }
}
