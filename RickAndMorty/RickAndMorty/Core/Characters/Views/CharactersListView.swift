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
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.navPath) {
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
                            .onTapGesture {
                                if !charactersViewModel.isLoading {
                                    router.navigate(to: .detail(character: character))
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Characters")
            .withAppRouter()
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
