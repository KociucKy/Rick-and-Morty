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
    @Published var error: URLError? {
        didSet {
            if error != nil {
                isShowingError = true
            } else {
                isShowingError = false
            }
        }
    }
    @Published var isShowingError: Bool = false
    let service: WebService

    init(service: WebService) {
        self.service = service
    }

    func loadContent() async throws {
        isLoading = true
        let charactersResponse: APIAllCharactersResponse = try await service.loadContent(
            endpoint: CharactersEndpoint.getAllCharacters
        )
        characters = charactersResponse.results.map { Character(apiItem: $0) }
        allCharactersInfo = AllCharactersInfo(apiItem: charactersResponse.info)
        currentPage += 1
        isLoading = false
    }

    func loadContentIfNeeded() async throws {
        isLoading = true
        let charactersResponse: APIAllCharactersResponse = try await service.loadContent(
            endpoint: CharactersEndpoint.getAnotherCharactersPage(page: currentPage)
        )
        characters.append(contentsOf: charactersResponse.results.map { Character(apiItem: $0) })
        allCharactersInfo = AllCharactersInfo(apiItem: charactersResponse.info)
        currentPage += 1
        isLoading = false
    }

    func restartPagination() {
        currentPage = 1
        allCharactersInfo = .emptyInfo
        characters.removeAll()
        Task {
            try await loadContent()
        }
        error = nil
    }
}
