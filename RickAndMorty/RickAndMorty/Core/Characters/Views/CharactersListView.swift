//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject private var charactersViewModel = CharactersViewModel(
        service: CharactersWebService(httpClient: URLSession(configuration: .default))
    )
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(charactersViewModel.characters) { character in
                        CharactersListRowView(character: character)
                            .task {
                                do {
                                    if character.id == charactersViewModel.characters.last?.id {
                                        try await charactersViewModel.loadContent()
                                    }
                                } catch {
                                    print("❌ Error: \(error)")
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Characters")
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

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
            .preferredColorScheme(.dark)
    }
}
