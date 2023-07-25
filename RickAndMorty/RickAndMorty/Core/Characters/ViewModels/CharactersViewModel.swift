//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

@MainActor
final class CharactersViewModel: ObservableObject {
    @Published var characters: [APICharacter] = []
    let service: CharactersWebService

    init(service: CharactersWebService) {
        self.service = service
    }

    func fetchAllCharacters() async throws {
        let charactersResponse = try await service.loadAllCharacters()
        characters = charactersResponse.results
        characters.forEach { character in
            print("🥳 Name: \(character.name)")
        }
    }
}
