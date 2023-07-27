//
//  FavoritesListView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var realmViewModel: RealmViewModel

    var body: some View {
        NavigationStack {
            Group {
                if !realmViewModel.favoriteCharacters.isEmpty {
                    ScrollView {
                        LazyVStack {
                            ForEach(realmViewModel.favoriteCharacters) { character in
                                CharactersListRowView(realmCharacter: character)
                            }
                        }
                    }
                } else {
                    VStack(spacing: 8) {
                        Image(systemName: SFSymbols.heartFilled.rawValue)
                            .font(.system(size: 75))
                        Text("You don't have any favorite characters yet.")
                            .multilineTextAlignment(.center)
                    }
                    .font(.mulish(.title, weight: .bold))
                    .foregroundColor(.gray.opacity(0.7))
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
            .environmentObject(RealmViewModel())
    }
}
