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
            ForEach(realmViewModel.favoriteCharacters) { character in
                Text(character.name)
            }
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
