//
//  FavoritesListView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

struct FavoritesListView: View {
    var body: some View {
        NavigationStack {
            Text("All favorites")
                .font(.largeTitle)
                .navigationTitle("Favorites")
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
