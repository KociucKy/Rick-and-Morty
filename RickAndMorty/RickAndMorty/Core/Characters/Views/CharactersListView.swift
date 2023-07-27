//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

struct CharactersListView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var charactersViewModel: CharactersViewModel

    var body: some View {
        NavigationStack(path: $router.navPath) {
            CharactersListScrollView(
                characters: $charactersViewModel.characters,
                isLoading: $charactersViewModel.isLoading,
                loadMoreContent: charactersViewModel.loadContentIfNeeded
            )
            .padding(.horizontal)
            .task {
                do {
                    try await charactersViewModel.loadContent()
                } catch {
                    print("❌ Error: \(error)")
                }
            }
        }
    }
}

// swiftlint: disable private_over_fileprivate
/// Struct used to work with Preview without exposing it to the Network Layer
fileprivate struct CharactersListScrollView: View {
    @EnvironmentObject var router: Router
    @Binding var characters: [Character]
    @Binding var isLoading: Bool
    var loadMoreContent: () async throws -> Void

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(characters) { character in
                    NavigationLink(value: Router.Destination.detail(character: character)) {
                        CharactersListRowView(character: character)
                    }
                    .task {
                        do {
                            if character.id == characters.last?.id {
                                try await loadMoreContent()
                            }
                        } catch {
                            print("❌ Error: \(error)")
                        }
                    }
                }
            }
        }
        .navigationTitle("Characters")
        .withAppRouter()
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
            .preferredColorScheme(.dark)
            .environmentObject(Router())
    }

    struct PreviewView: View {
        @State private var characters = Character.mockCharacters
        @State private var isLoading = false

        var body: some View {
            NavigationStack {
                CharactersListScrollView(characters: $characters, isLoading: $isLoading) {}
            }
        }
    }
}
