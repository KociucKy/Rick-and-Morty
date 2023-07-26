//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import Foundation

@MainActor
final class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var allCharactersInfo: AllCharactersInfo = .emptyInfo
    @Published var isLoading: Bool = false
    let service: CharactersWebService

    init(service: CharactersWebService) {
        self.service = service
    }

    func fetchAllCharacters() async throws {
        isLoading = true
        let charactersResponse = try await service.loadAllCharacters()
        characters = charactersResponse.results.map { Character(apiItem: $0) }
        allCharactersInfo = AllCharactersInfo(apiItem: charactersResponse.info)
        isLoading = false
    }
}
