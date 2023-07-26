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
            Text("All characters")
                .font(.largeTitle)
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
    }
}
