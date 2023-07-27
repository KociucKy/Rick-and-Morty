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
    @FocusState private var focused: Bool

    var body: some View {
        NavigationStack(path: $router.navPath) {
            Group {
                if !charactersViewModel.characters.isEmpty {
                        TextField("Search characters by name", text: $charactersViewModel.charactersName) {
                            Task {
                                try await charactersViewModel.filterCharacters()
                            }
                        }
                        .submitLabel(.search)
                        .textFieldStyle(.roundedBorder)
                        .focused($focused)
                        .showClearButton($charactersViewModel.charactersName)
                        .padding(.vertical)
                    CharactersListScrollView(
                        characters: $charactersViewModel.characters,
                        isLoading: $charactersViewModel.isLoading,
                        error: $charactersViewModel.error,
                        loadMoreContent: charactersViewModel.isFiltering ?
                            charactersViewModel.getMoreFilteredCharactersIfNeeded :
                            charactersViewModel.loadContentIfNeeded
                    )
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button {
                                focused = false
                            } label: {
                                Image(systemName: SFSymbols.keyboardDown.rawValue)
                            }
                        }
                    }
                    .onChange(of: charactersViewModel.charactersName) { newValue in
                        if newValue.isEmpty {
                            charactersViewModel.restartPagination()
                        }
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .padding(.horizontal)
            .task {
                if !charactersViewModel.isFiltering {
                    do {
                        try await charactersViewModel.loadContent()
                    } catch {
                        charactersViewModel.error = error as? URLError
                    }
                }
            }
            .alert(
                charactersViewModel.error?.localizedDescription ?? "",
                isPresented: $charactersViewModel.isShowingError
            ) {
                Button("Retry") {
                    charactersViewModel.restartPagination()
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
    @Binding var error: URLError?
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
                            self.error = error as? URLError
                        }
                    }
                }
            }
        }
        .navigationTitle("Characters")
        .disabled(error != nil)
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
                CharactersListScrollView(characters: $characters, isLoading: $isLoading, error: .constant(nil)) {}
            }
        }
    }
}
