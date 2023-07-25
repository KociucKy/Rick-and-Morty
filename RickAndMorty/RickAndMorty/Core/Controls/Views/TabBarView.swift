//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

struct TabBarView: View {
    @AppStorage("selectedTab") var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            CharactersListView()
                .tag(0)
                .tabItem { Label("Characters", systemImage: "person.3.fill") }
            FavoritesListView()
                .tag(1)
                .tabItem { Label("Favorites", systemImage: "heart.fill") }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
