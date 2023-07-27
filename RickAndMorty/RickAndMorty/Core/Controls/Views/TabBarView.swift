//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

struct TabBarView: View {
    @AppStorage("selectedTab") var selectedTab: Int = 0
    @StateObject private var router = Router()
    @StateObject private var charactersViewModel: CharactersViewModel
    @StateObject private var realmViewModel = RealmViewModel()

    init(charactersWebService: WebService) {
        _charactersViewModel = StateObject(wrappedValue: CharactersViewModel(service: charactersWebService))
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            CharactersListView()
                .tag(0)
                .tabItem { Label("Characters", systemImage: SFSymbols.threePersonsFilled.rawValue) }
                .environmentObject(router)
                .environmentObject(charactersViewModel)
            FavoritesListView()
                .tag(1)
                .tabItem { Label("Favorites", systemImage: SFSymbols.heartFilled.rawValue) }
        }
        .environmentObject(realmViewModel)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(charactersWebService: CharactersWebService(httpClient: URLSession(configuration: .default)))
    }
}
