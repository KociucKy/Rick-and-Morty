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
    @Published var currentPage: Int = 1
    let service: CharactersWebService

    init(service: CharactersWebService) {
        self.service = service
    }

    func loadContent() async throws {
        isLoading = true
        if currentPage == 1 && characters.isEmpty {
            let charactersResponse = try await service.loadAllCharacters()
            characters = charactersResponse.results.map { Character(apiItem: $0) }
            allCharactersInfo = AllCharactersInfo(apiItem: charactersResponse.info)
        } else if currentPage < allCharactersInfo.pages {
            let charactersResponse = try await service.loadAnotherPage(currentPage)
            characters.append(contentsOf: charactersResponse.results.map { Character(apiItem: $0) })
            allCharactersInfo = AllCharactersInfo(apiItem: charactersResponse.info)
        }
        currentPage += 1
        isLoading = false
    }
}
