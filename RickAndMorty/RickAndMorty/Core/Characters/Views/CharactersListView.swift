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
            Group {
                if charactersViewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(charactersViewModel.characters) { character in
                                CharactersListRowView(character: character)
                                    .redacted(reason: charactersViewModel.isLoading ? .placeholder : [])
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Characters")
            .task {
                do {
                    try await charactersViewModel.fetchAllCharacters()
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
