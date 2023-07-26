//
//  CharactersLocation.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import Foundation

struct CharacterLocation {
    let name: String
    let url: URL?

    init(name: String, url: URL?) {
        self.name = name
        self.url = url
    }
}

extension CharacterLocation {
    init(apiItem: APILocation) {
        self.init(name: apiItem.name, url: URL(string: apiItem.url))
    }
}
